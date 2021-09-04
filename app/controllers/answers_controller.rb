class AnswersController < ApplicationController
  def new
  end

  def create
    question = Question.find(params[:question_id])
    answer = current_user.answers.new(answer_params)
    answer.question_id = question.id
    if answer.save
      redirect_to question_path(question.id)
    else
      render question_path(question.id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:answer_content)
  end
end
