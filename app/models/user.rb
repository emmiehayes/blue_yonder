class User < ApplicationRecord
  validates_presence_of :name, :high_pref, :low_pref
  validates :email_address, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_many :favorites
  has_many :locations, through: :favorites

  has_secure_password
end
