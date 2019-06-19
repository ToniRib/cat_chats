class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])

    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id

      redirect_to conversations_path
    else
      flash[:error] = "Invalid login credentials. Please try again."

      redirect_to root_path
    end
  end

  def destroy
    session.clear

    redirect_to root_path
  end
end
