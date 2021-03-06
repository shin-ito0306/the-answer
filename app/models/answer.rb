class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :notifications, dependent: :destroy

  validates :answer_content, presence: true
  validates :best_answer, inclusion: { in: [true, false] }
  
  # ベストアンサーを選んだ時の処理
  def chosen_by_current_user!(current_user)
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

  def self.user_answers(user_id)
    Answer.where(user_id: user_id)
  end

private
  
  # ベストアンサーの通知
  def  create_notification_best_answer!(current_user, user_id, question_id)
    notification = current_user.active_notifications.new(visited_id: user_id, question_id: question_id, action: "best")
    notification.save!
  end

  # 質問者のポイントを引く
  def point_expense!(user, reword_point)
    user.update!(point: user.point -= reword_point)
  end
  
  # ベストアンサーをした回答者のポイントを増やす
  def point_income!(user, reword_point)
    user.update!(point: user.point += reword_point)
  end

end
