class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email_address(params[:email_address])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if current_admin?
        redirect_to admin_dashboard_index_path
      elsif current_user
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
