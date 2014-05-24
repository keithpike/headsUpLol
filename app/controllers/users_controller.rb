class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)

      redirect_to root_url #render dashboard with first blog showing
    else
      #render errors
    end
  end

  def show
    @user = User.find(params[:id])
      redirect_to root_url #render dashboard with first blog
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
