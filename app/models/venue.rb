class Venue < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  has_many :venuetags, dependent: :destroy
  has_many :tags, through: :venuetags

  CATEGORIES = ['cafe', 'restaurant', 'bar']
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
