class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :venues
  has_one_attached :photo

  SIZES = ['small', 'med-small', 'medium', 'med-large', 'large']
  validates :dog_name, presence: true
  validates :owner_name, presence: true
  validates :size, inclusion: { in: SIZES }
end
