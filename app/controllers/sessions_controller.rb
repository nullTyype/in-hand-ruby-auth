class SessionsController < ApplicationController

  def page_requires_login
  end

  def new
  end

  def create

    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])

      sessions[:user_id] = @user.id

      redirect_to 'welcome'

    else

      redirect_to '/login'
    end

  end

  def login
  end

  def welcome
  end
end
