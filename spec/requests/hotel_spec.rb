require 'rails_helper'

RSpec.describe 'Hotels', type: :request do
  before(:each) do
    @admin = User.find_by(admin: true)
    post '/auth/login', params: { email: @admin.email, password: 'admin' }
    @token = JSON.parse(response.body)['token']
  end

  it 'returns a 200' do
    get '/hotels', params: {}, headers: { Authorization: "Bearer #{@token}" }
    expect(response).to have_http_status(:ok)
  end

  it 'returns a list of hotels' do
    get '/hotels', params: {}, headers: { Authorization: "Bearer #{@token}" }
    hotels = JSON.parse(response.body)
    expect(hotels.length).to be(2)
  end

  it 'return a specific hotel' do
    get '/hotels/1', params: {}, headers: { Authorization: "Bearer #{@token}" }
    hotel = JSON.parse(response.body)
    expect(hotel['name']).to eq('The Ritz Hotel')
  end

  it 'create a new hotel' do
    new_hotel = {
      name: 'new',
      location: 'Germany',
      description: 'nice place',
      rating: 4,
      image: 'Hotel image',
      rooms: [
        {
          id: 1,
          price: 400,
          image: 'Room image'
        }
      ]
    }
    post '/hotels', params: new_hotel, headers: { Authorization: "Bearer #{@token}" }
    expect(response).to have_http_status(:success)
  end

  it 'delete a hotel' do
    delete '/hotels/1', params: {}, headers: { Authorization: "Bearer #{@token}" }
    expect(response.body).to eq('Hotel deleted successfully')
  end
end
