class UsersController < ApplicationController
before_action :current_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @locations = Location.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    if current_admin?
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_dashboard_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :high_pref, :low_pref)
  end
end
