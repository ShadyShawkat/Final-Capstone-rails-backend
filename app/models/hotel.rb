class Hotel < ApplicationRecord
  has_many :hotel_rooms
  has_many :rooms, through: :hotel_rooms
end
