class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :high_pref, :low_pref
  validates :email_address, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :favorites
  has_many :locations, through: :favorites

  enum role:['default', 'admin']

  def self.total_count
    count
  end

  def self.newest_user_created_at
    order(created_at: :asc).last.created_at
  end

end
