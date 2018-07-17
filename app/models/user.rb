class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :high_pref, :low_pref
  validates :email_address, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :favorites
  has_many :locations, through: :favorites

end

=begin
   tried adding this and it doesn't work: validates_presence_of :password, :on => :create
=end
