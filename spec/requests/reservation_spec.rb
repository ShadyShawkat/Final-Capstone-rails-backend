require 'rails_helper'

RSpec.describe 'reservations_controller', type: :request do
  before :each do
    post '/auth/login', params: { email: 'admin@gmail.com', password: 'admin' }
    @token = JSON.parse(response.body)['token']
  end

  it 'GET index' do
    get '/reservations', params: {}, headers: { Authorization: "Bearer #{@token}" }
    # hotels = JSON.parse(response.body)
    expect(response).to have_http_status(:ok)
  end
end
