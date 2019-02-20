class Photo < ApplicationRecord
  belongs_to :tour

  has_attached_file :image
end
