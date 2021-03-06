class SessionsController < ApplicationController
  layout 'splash', only: [:new, :create]
  before_action :ensure_logged_out, only: [:new, :create]
  def new

  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login!(@user)
      redirect_to dashboard_url
    else
      render :new
      #render error
    end
  end

  def destroy
    logout
    redirect_to root_url
    # redirect user to new session
  end

end
