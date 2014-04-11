class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      redirect_to products_path, notice: "Logged in!"
    else
      flash[:alert] = "Name or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_path, notice: "Logged out!"
  end

end
