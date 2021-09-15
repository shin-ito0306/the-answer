class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :notifications, dependent: :destroy

  attachment :question_image

  validates :title, presence: true
  validates :content, presence: true
  validates :reword_point, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :accepting, inclusion: { in: [true, false] }
  validate :check_reword_point

  def self.search_keyword(keyword)
    Question.where("title LIKE ?", "%#{keyword}%")
  end

  def self.search_resolved
    Question.joins(:answers).where(answers: {best_answer: 1})
  end

  def self.search_unanswered
    Question.left_joins(:answers).where(answers: {id: nil})
  end

  def self.search_accepting
    Question.where(accepting: true)
  end

  def have_best_answer?
    answers.where(best_answer: 1).present?
  end

  def written_by?(current_user)
    user_id == current_user.id
  end

  def answer_user?(answer_user_id)
    user_id == answer_user_id
  end

  def have_answers?
    answers.present?
  end

  def answer_by_current_user!(current_user, answer_content)
    ActiveRecord::Base.transaction do
      answer = current_user.answers.new(answer_content: answer_content, question_id: id)
      answer.save!
      create_notification_answer!(current_user, user_id, id)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  private
  def create_notification_answer!(current_user, question_user_id, answer_question_id)
    notification = current_user.active_notifications.new(visited_id: question_user_id, question_id: answer_question_id, action: "answer")
    notification.save!
  end

  def check_reword_point
    if user.point < reword_point
      errors.add(:reword_point,"は所持ポイントより少なくしてください")
    end
  end
end
