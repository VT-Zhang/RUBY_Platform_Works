class Trip < ActiveRecord::Base
  belongs_to :driver
  belongs_to :rider
  has_many :riders
  has_one :driver

  validates :a_city, :a_state, :a_zipcode, :b_city, :b_state, :b_zipcode, :date, :price, presence:true
  validates :a_zipcode, :b_zipcode, numericality: true, length: { is: 5 }
  validates :price, numericality: true, :numericality => { :greater_than_or_equal_to => 0, message: "must be positive"}
  validate  :date_only_in_the_future
  def date_only_in_the_future
    if date < Date.today
      errors.add(:date, "must be in the future.")
    end
  end
end
