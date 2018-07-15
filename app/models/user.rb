class User < ApplicationRecord
  validates_presence_of :name, :password_digest, :high_pref, :low_pref
  validates_presence_of :email_address, uniqueness: true
  has_many :favorites
  has_many :locations, through: :favorites
end
