module AnswersHelper

  def requirements_best_answer?(question, user_id)
    question.written_by?(current_user) && !question.answered_by?(user_id) && !question.have_best_answer?
  end
end
