class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def create

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])

      session[:user_id] = @user.id

      redirect_to '/authorized'

    else

      redirect_to '/login'
    end

  end

  def page_requires_login
  end

  def logout
      if session[:user_id]
        session[:user_id] = nil
        redirect_to '/login'
      else 
        redirect_to '/welcome'
      end
  end

end
