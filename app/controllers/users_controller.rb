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

  def unsubscribe
  end

  def destroy
    User.find(current_user.id).destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_image, :introduction, :point)
  end
end
