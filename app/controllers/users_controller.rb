class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def add_new_point
    @user = User.find(current_user.id)
  end

  def add_point
    @user = User.find(current_user.id)
    if params[:point].to_i > 0
      total_point = params[:point].to_i + @user.point
      if @user.update(point: total_point)
        redirect_to user_path(@user.id)
      else
        render :add_new_point
      end
    else
      flash[:alert] = "0ptより小さい数字は追加できません"
      render :add_new_point
    end
  end

  def unsubscribe
  end

  def destroy
    User.find(current_user.id).destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_image, :introduction)
  end


end
