class Room < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :hotel_rooms
  has_many :hotels, through: :hotel_rooms
end
