class Venue < ApplicationRecord
  belongs_to :user

  CATEGORIES = ['cafe', 'restaurant', 'bar', 'park']
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
