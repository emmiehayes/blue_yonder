class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
    @locations = Location.all
    @favorites = Favorite.group_by_location
  end

  private

  def require_admin
    render file:'/public/404' unless current_admin?
  end
end
