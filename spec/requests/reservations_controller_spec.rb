require 'rails_helper'

RSpec.describe 'reservations_controller', type: :request do
  before :each do
    post '/auth/login', params: { email: 'admin@gmail.com', password: 'admin' }
    @token = JSON.parse(response.body)['token']
  end

  it 'GET index' do
    get '/reservations', params: {}, headers: { Authorization: "Bearer #{@token}" }
    expect(response).to have_http_status(:ok)
  end

  it 'POST create' do
    post '/reservations', params: { date: '2022-05-10', hotel_room_id: 1 },
                          headers: { Authorization: "Bearer #{@token}" }
    expect(response).to have_http_status(:created)
  end

  it 'Test if the recently created entry is listed on the index' do
    post '/reservations', params: { date: '2022-05-11', hotel_room_id: 2 },
                          headers: { Authorization: "Bearer #{@token}" }
    get '/reservations', params: {}, headers: { Authorization: "Bearer #{@token}" }
    json = JSON.parse(response.body)
    expect(json.first['date']).to eq('2022-05-11')
  end

  it 'DELETE delete' do
    post '/reservations', params: { date: '2022-05-10', hotel_room_id: 1 },
                          headers: { Authorization: "Bearer #{@token}" }
    delete '/reservations/1', params: {}, headers: { Authorization: "Bearer #{@token}" }
    expect(response).to have_http_status(:ok)
  end
end
