class ReservationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :date, :hotel_room
end
