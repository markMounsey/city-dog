class Tag < ApplicationRecord
  has_many :venuetags, dependent: :destroy
  has_many :venues, through: :venuetags
  validates :name, presence: true
  validates :name, uniqueness: true
end
