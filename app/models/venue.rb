class Venue < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
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
