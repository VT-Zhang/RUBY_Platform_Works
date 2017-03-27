class Car < ActiveRecord::Base
  belongs_to :driver
  validates :make, :model, :year, :color, :mileage, presence:true, :on => :create
  validates :mileage, numericality:true, :numericality => { :greater_than_or_equal_to => 0, message: "must be positive"}
end
