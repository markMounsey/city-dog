class Tag < ApplicationRecord
  has_many :venuetags, dependent: :destroy
  has_many :venues, through: :venuetags
  validates :name, presence: true, uniqueness: true

  $tagnames = ["€", "€€", "€€€", "cozy", "crowded", "dogtreats", "friendly", "humanlikesbeer",
              "humanlikesfood", "inside", "outside", "waterbowls", "loud", "quiet",
              "warm", "spacious", "poochparty"]
end
