class Review < ApplicationRecord
  belongs_to :venue
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, presence: true, length: { maximum: 200 }
end
