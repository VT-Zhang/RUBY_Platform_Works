class User < ActiveRecord::Base
  has_secure_password
  has_many :friends, :foreign_key => "user_id", :class_name => "Network"
  has_many :inviters, :foreign_key => "user_id", :class_name => "Invitation"

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :description, :password, :password_confirmation, presence: true, :on => :create
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }, :on => :create
  before_create :password, length: {minimum: 8}
end
