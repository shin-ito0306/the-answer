class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.user_id = current_user.id
    if question.save
      redirect_to questions_path
    else
      render new
    end
  end

  def edit
  end

  def udate
  end

  def destroy
  end

  private
  def question_params
    params.require(:question).permit(:title, :question_image, :content)
  end
end
