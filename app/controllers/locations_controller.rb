class LocationsController < ApplicationController

  def add_favorite
    @location = Location.find(params[:id])
    @location.favorites.create(user: current_user)
    redirect_to user_path(current_user)
  end

  def remove_favorite
    Favorite.find_by(user: current_user, location_id: params[:id]).destroy
    redirect_to user_path(current_user)
  end
end
