module AnswersHelper

  def requirements_best_answer?(answer)
    answer.question.written_by?(current_user) && !answer.question.answer_user?(answer.user_id) && !answer.question.have_best_answer?
  end
end
