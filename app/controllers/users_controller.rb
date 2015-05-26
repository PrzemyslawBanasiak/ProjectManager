class UsersController < ApplicationController
  skip_before_filter :require_login

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @readOnly = @user != current_user
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
      flash[:success] = 'Another success in your life, congratulations.'
      redirect_to '/login'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = "Unable to edit someone's else profile"
    else
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
      end
    end
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :firstName, :lastName)
  end
end



