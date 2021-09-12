class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    if @question.answer_by_current_user!(current_user, answer_params[:answer_content])
      redirect_to question_path(@question.id)
    else
      @answer = Answer.new
      flash[:alert] = "問題が発生しました"
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(params[:question_id])
    else
      @question = Question.find(params[:question_id])
      render :edit
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end

  def best
    question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    if question.answers.where(best_answer: 1).blank? && @answer.user_id != question.user_id
      @answer.choose_by_current_user!(current_user)
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id])
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer_content)
  end
end
