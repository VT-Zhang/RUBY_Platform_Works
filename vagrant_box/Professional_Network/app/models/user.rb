class User < ActiveRecord::Base
  has_secure_password
  has_many :networks, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :friends, through: :networks, source: :user
  has_many :inviters, through: :invitations, source: :user

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :description, :password, :password_confirmation, presence: true, :on => :create
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }, :on => :create
  before_create :password, length: {minimum: 8}
end
