class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hotel_room
end
