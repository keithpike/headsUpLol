class UsersController < ApplicationController
  before_action :ensure_logged_out, only: [:new, :create]
  layout 'splash', only: [:new, :create]
  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      @blog = @user.blogs.create(title: "Default blog", primary: true, avatar_url: "https://s3-us-west-1.amazonaws.com/headsuplolimages/thumbnail_#{(1..10).to_a.sample}.png")
      login!(@user)
      redirect_to dashboard_url #render dashboard with first blog showing
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
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
