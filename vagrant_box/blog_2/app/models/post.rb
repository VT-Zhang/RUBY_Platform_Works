class Post < ActiveRecord::Base
    has_many :message
    belongs_to :user
    belongs_to :blog
    validates :title, :content presence: true
end
