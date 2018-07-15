class Location < ApplicationRecord
  validates_presence_of :nick_name, :state, :high_temp, :low_temp
  has_many :favorites
  has_many :users, through: :favorites
end
