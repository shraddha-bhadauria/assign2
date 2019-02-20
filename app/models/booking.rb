class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  validates :bseats, presence: true
  validates :bwait_list, presence: true
  validates :customer, presence: true
  validates :tour, presence: true
end
