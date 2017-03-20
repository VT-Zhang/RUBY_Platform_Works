class Event < ActiveRecord::Base
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :users, through: :participation
  validates :name, :date, :location, :state, :user, presence:true
  validate :date_only_in_the_future

  def date_only_in_the_future
    if date < Date.today
      errors.add(:date, "Date must be in the future.")
    end
  end

end
