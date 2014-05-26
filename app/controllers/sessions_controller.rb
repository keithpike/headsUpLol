class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    debugger
    if @user
      login!(@user)
      redirect_to users_dashboard_url
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
