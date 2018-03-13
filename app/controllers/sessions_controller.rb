class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to(session[:intended_url] || user)
      session[:intended_url] = nil
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "You're now signed out!"
  end
end
