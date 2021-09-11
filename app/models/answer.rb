class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :notifications, dependent: :destroy

  validates :text_content, presence: true
  validates :best_answer, inclusion: { in: [true, false] }

  def choose_by_current_user!(current_user)
    ActiveRecord::Base.transaction do
      self.update!(best_answer: true)
      question.update!(accepting: false)
      point_expense!(question.user, question.reword_point)
      point_income!(user, question.reword_point)
      create_notification_best_answer!(current_user, user_id, question_id)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def current_user?(current_user)
    user_id == current_user.id
  end

private

  def  create_notification_best_answer!(current_user, answer_user_id, question_id)
    notification = current_user.active_notifications.new(visited_id: user_id, question_id: question_id, action: "best")
    notification.save!
  end

  def point_expense!(user, reword_point)
    user.update!(point: user.point -= reword_point)
  end

  def point_income!(user, reword_point)
    user.update!(point: user.point += reword_point)
  end

end
