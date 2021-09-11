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
    answer = Answer.find(params[:id])
    if answer.update(answer_params)
      redirect_to question_path(params[:question_id])
    else
      render :edit
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    @question = Question.find(params[:question_id])
    redirect_to question_path(params[:question_id])
  end

  def best
    question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    if question.answers.where(best_answer: 1) == nil && @answer.user_id == question.user_id
      redirect_to question_path(params[:question_id])
    else
      @answer.update(best_answer: 1)
      question.update(accepting: false)
      question.user.update(point: question.user.point -= question.reword_point)
      @answer.user.update(point: @answer.user.point += question.reword_point)
      notification = current_user.active_notifications.new(visited_id: @answer.user_id, question_id: @answer.question_id, action: "best")
      notification.save if notification.valid?
      redirect_to question_path(params[:question_id])
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer_content)
  end
end
