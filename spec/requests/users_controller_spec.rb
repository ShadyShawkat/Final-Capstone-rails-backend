require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  before do
    post users_path({ name: 'Whatever', email: 'a@gmail.com', password: '123456' })
  end

  describe 'POST /users' do
    it 'creates an user successfully' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /auth/login' do
    before do
      post auth_login_path({ email: 'a@gmail.com', password: '123456' })
    end

    it 'logs in an existent user successfully' do
      expect(JSON.parse(response.body)).to have_key('token')
    end

    it 'returns a 200 status' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE users/:id' do
    before do
      post auth_login_path({ email: 'a@gmail.com', password: '123456' })
      @token = JSON.parse(response.body)['token']
      delete '/users/3', params: { email: 'a@gmail.com', password: '123456' },
                         headers: { Authorization: "Bearer #{@token}" }
    end

    it 'deletes a user successfully' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
