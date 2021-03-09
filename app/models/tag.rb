class Tag < ApplicationRecord
  has_many :venuetags, dependent: :destroy
  has_many :venues, through: :venuetags
  validates :name, presence: true, uniqueness: true

  $tagnames = ["waterbowls", "loud", "dogtreats", "friendly", "warm",
              "humanlikesfood", "crowded", "cozy", "quiet", "outside",
              "inside", "spacious", "€", "€€", "€€€", "poochparty", "humanlikesbeer"]
end
