class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :location

  def self.total_locations_favorited
    distinct.pluck(:location_id).count
  end

  def self.total_users_with_a_favorite
    distinct.pluck(:user_id).count
  end

  def self.group_by_location
    joins(:location)
    .group('locations.nick_name')
    .count(:user_id)
  end

  def self.most_favorite
    group_by_location.key(group_by_location.values.max)
  end
end
