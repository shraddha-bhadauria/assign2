class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :tour

  validates :subject, presence: true
  validates :body, presence: true


end
