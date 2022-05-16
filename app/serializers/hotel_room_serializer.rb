class HotelRoomSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :price, :featured_room_image, :room

  def featured_room_image
    return unless object.featured_room_image.attached?

    {
      url: rails_blob_url(object.featured_room_image, only_path: true)
    }
  end
end
