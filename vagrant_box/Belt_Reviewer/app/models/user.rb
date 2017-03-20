class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :participations, dependent: :destroy
  has_many :events_participated, through: :participations, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :location, :state, :password, :password_confirmation, presence:true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: true
  validates :password, :password_confirmation, length: { minimum: 8 }
end
