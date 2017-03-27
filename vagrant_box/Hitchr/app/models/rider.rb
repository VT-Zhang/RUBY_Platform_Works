class Rider < ActiveRecord::Base
  has_secure_password
  has_many :trips, dependent: :destroy
  has_many :drivers, through: :trips, source: :driver

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :gender, :birthday, :password, :password_confirmation, presence: true, :on => :create
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }, :on => :create
  validates :password, :password_confirmation, length: {minimum: 8}, :on => :create
  validate :birthday_18_year_old

  def birthday_18_year_old
    if birthday.to_date + 18.years > Date.today
      errors.add(:birthday, "must be 18 years old to become a memeber.")
    end
  end
end
