class Tag < ApplicationRecord
  has_many :venues, through: :venuetags
  validates :name, presence: true, length: { maximum: 25 }
end
