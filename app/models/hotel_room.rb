class HotelRoom < ApplicationRecord
  belongs_to :hotel
  belongs_to :room

  has_many :reservation, dependent: :destroy
end
