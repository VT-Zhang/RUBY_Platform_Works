class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :name, :password, :password_confirmation, presence:true
  validates :email, format: {with: EMAIL_REGEX}, uniqueness:true, length: {minimum:8}

end
