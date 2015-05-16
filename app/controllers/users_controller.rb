class UsersController < ApplicationController
  skip_before_filter :require_login

  def show
    @user = User.find(params[:id])
  end

  def new
    if current_user
      redirect_to '/'
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account has been created, you should wait for admin corfirmation."
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end



