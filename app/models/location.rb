class Location < ApplicationRecord
  validates_presence_of :nick_name, :state, :high_temp, :low_temp
  has_many :favorites
  has_many :users, through: :favorites

  def self.temp_match(user)
    where(["high_temp <= ? and low_temp >= ?", user.high_pref, user.low_pref])
  end

  def self.total_count
    count
  end
end
