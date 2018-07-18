class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :location

  def self.total_locations_favorited
    distinct.pluck(:location_id).count
  end

  def self.total_users_with_a_favorite
    distinct.pluck(:user_id).count
  end

  def self.most_favorited
    group(:location_id).count
  end
end
