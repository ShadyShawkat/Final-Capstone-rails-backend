require 'rails_helper'

RSpec.describe 'Hotels', type: :request do
  before(:each) do
    @admin = User.find_by(admin: true)
    post '/auth/login', params: { email: @admin.email, password: "admin" }
    @token = JSON.parse(response.body)['token']
  end

  it "returns a 200" do
    get '/hotels', params: {}, headers: { Authorization: "Bearer #{@token}" }
    expect(response).to have_http_status(:ok)
  end

  it "returns a list of hotels" do
    get '/hotels', params: {}, headers: { Authorization: "Bearer #{@token}" }
    hotels = JSON.parse(response.body)
    expect(hotels.length).to be(2)
  end

end
