class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
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
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.update(question_params)
      redirect_to question_path(question.id)
    else
      render :edit
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  def search
    if params[:keyword].present?
      @questions = Question.search_keyword(params[:keyword])
    else
      redirect_to questions_path
    end
    case params[:search_kind]
    when "解決済"
      @questions = Question.search_resolved
    when "未回答"
      @questions = Question.search_unanswered
    when "受付中"
      @questions = Question.search_accepting
    end

  end

  def update_accepting
    @question = Question.find(params[:question_id])
    if @question.user_id == current_user.id
      if @question.accepting
        @question.update(accepting: false)
      else
        @question.update(accepting: true)
      end
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :question_image, :content, :reword_point)
  end
end
