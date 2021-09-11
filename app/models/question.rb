class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :notifications, dependent: :destroy

  attachment :question_image

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

  def current_user?(current_user)
    user_id == current_user.id
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
end
