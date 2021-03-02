class Venuetag < ApplicationRecord
  belongs_to :venue
  belongs_to :tag

  validates :venue_id, uniqueness: { scope: :tag }
end
