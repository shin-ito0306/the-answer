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
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  def update
    answer = Answer.find(params[:id])
    if answer.update(answer_params)
      redirect_to question_path(params[:question_id])
    else
      render :edit
    end
  end

  def destroy
    Answer.find_by(params[:id]).destroy
    @question = Question.find(params[:question_id])
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:answer_content)
  end
end
