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
end
