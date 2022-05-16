Reservation.destroy_all
HotelRoom.destroy_all
User.destroy_all
Room.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

admin = User.create(name: "Admin", admin: true, profile_picture: "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png", email: "admin@gmail.com", password: "admin")
user1 = User.create(name: "User1", profile_picture: "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png", email: "user1@gmail.com", password: "user")
user2 = User.create(name: "User2", profile_picture: "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png", email: "user2@gmail.com", password: "user")

room_single = Room.create(type: "Single", guests_number: 2)
room_double = Room.create(type: "Double", guests_number: 4)
room_suite = Room.create(type: "Suite", guests_number: 8)

# hotel1 = admin.hotels.create(name: "The Ritz Hotel", description: "We are London's most iconic hotel. A five star haven on Piccadilly that is famous the world over for its historic elegance, impeccable service, impressive suites, and legendary Afternoon Tea.", rating: 5, location: "London, United Kingdom", image: "https://www.theritzlondon.com/wp-content/uploads/2017/01/Side-Exterior.jpg")
# hotel2 = admin.hotels.create(name: "Hilton Imperial Dubrovnik", description: "Set in a historic building dating back to 1897, our hotel fuses period charm with modern styling.", rating: 5, location: "Dubrovnik, Croatia", image: "https://www.hilton.com/im/en/DBVHIHI/15839528/2.-hilton-imperial-dubrovnik-exterior-.jpg?impolicy=crop&cw=5000&ch=2669&gravity=NorthWest&xposition=0&yposition=142&rw=800&rh=427")

# hotel1_room_single = hotel1.hotel_rooms.create(room_id: room_single.id, image: "https://s7d2.scene7.com/is/image/ritzcarlton/294240_extracted?$XlargeViewport100pct$", price:"300")
# hotel1_room_double = hotel1.hotel_rooms.create(room_id: room_double.id, image: "https://s7d2.scene7.com/is/image/ritzcarlton/294239_extracted?$XlargeViewport100pct$", price:"500")
# hotel1_room_suite = hotel1.hotel_rooms.create(room_id: room_suite.id, image: "https://s7d2.scene7.com/is/image/ritzcarlton/laxlz-queen-suite-50683108?$SmallViewport100pct$", price:"1000")

# hotel2_room_single = hotel2.hotel_rooms.create(room_id: room_single.id, image: "https://ak-d.tripcdn.com/images/02015120008oavgp82A4D_R_550_412_R5_D.jpg", price:"250")
# hotel2_room_double = hotel2.hotel_rooms.create(room_id: room_double.id, image: "https://ak-d.tripcdn.com/images/0202m120009911qnhB32B_R_550_412_R5_D.jpg", price:"475")

# user1.reservations.create(hotel_room_id: hotel1_room_suite.id, date: "2022-07-07")

# user2.reservations.create(hotel_room_id: hotel2_room_single.id, date: "2023-01-01")
