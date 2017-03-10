class Blog < ActiveRecord::Base
    has_many :post
    has_many :user through :owner
    has_many :message though :post
    validates :name, :description, presence: true 
end
