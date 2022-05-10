class Hotel < ApplicationRecord
  has_many :hotel_rooms, dependent: :destroy
  has_many :rooms, through: :hotel_rooms
end
