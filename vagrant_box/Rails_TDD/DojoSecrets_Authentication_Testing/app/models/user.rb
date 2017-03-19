class User < ActiveRecord::Base
    has_many :secrets
    has_many :likes, dependent: :destroy
    has_many :secrets_liked, through: :likes, source: :secret

    has_secure_password

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    before_validation :downcase_email

    private
    def downcase_email
          self.email = email.downcase if email.present?
    end

    validates :name, :email, :password, presence: true
    validates :email, format: { with: EMAIL_REGEX }, uniqueness: true
end
