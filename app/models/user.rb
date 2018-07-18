class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :high_pref, :low_pref
  validates :email_address, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :favorites, dependent: :destroy
  has_many :locations, through: :favorites

  enum role:['default', 'admin']

  def self.total_count
    count
  end

  def self.newest_user_created_at
    order(created_at: :asc).last.created_at.to_formatted_s
  end

  def valid_preference_range
    temperature_range = (1..100)
    temperature_range.include?(high_pref) && temperature_range.include?(low_pref)
  end

  def preferences_valid?
    valid_preference_range && low_pref <= high_pref
  end
end
