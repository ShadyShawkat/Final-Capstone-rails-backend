class HotelRoom < ApplicationRecord
  belongs_to :hotel
  belongs_to :room

  has_many :reservations, dependent: :destroy

  has_one_attached :featured_room_image
end
