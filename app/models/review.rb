class Review < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :customers
  validates :id, presence: true, uniqueness: {case_sensitive: false}
  validates :customer_id, presence: true
  validates :subject, presence: true , length: {maximum: 50}
  validates :body, presence: true , length: {maximum: 150}
end
