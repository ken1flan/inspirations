class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(id: @user.id) unless user_signed_in? && current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = params.require(:user).permit(:name)

    if @user.save
      redirect_to @user
    else
      render action: edit
    end
  end
end
