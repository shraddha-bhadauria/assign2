class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  validates :bseats, presence: true, numericality: true
  validates :bwait_list, presence: true, numericality: true
  validates :customer, presence: true
  validates :tour, presence: true
end
