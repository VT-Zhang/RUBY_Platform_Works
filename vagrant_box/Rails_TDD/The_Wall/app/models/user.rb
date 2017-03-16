class User < ActiveRecord::Base
    validates :username, uniqueness: true,  presence: true, length: { minimum: 6 }
end
