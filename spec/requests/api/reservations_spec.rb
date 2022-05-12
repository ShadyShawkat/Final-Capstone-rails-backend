require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  before :each do
    post '/auth/login', params: { email: 'admin@gmail.com', password: 'admin' }
    @token = JSON.parse(response.body)['token']
  end

  path '/reservations' do
    get('List reservations') do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string, required: true, description: 'Client token'
      response(200, 'successful') do
        let(:Authorization) { "Bearer #{@token}" }
        run_test!
      end
    end

    post 'Creates a reservation successfully' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string, required: true, description: 'Client token'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: { date: { type: :string, format: :datetime }, hotel_room_id: { type: :integer },
                      user_id: { type: :integer } },
        required: %w[date hotel_room_id]
      }

      response '201', 'reservation created' do
        let(:Authorization) { "Bearer #{@token}" }
        let(:reservation) do
          { date: '2022-05-11', hotel_room_id: 2, user_id: '2' }
        end
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    delete('Deletes a reservation') do
      tags 'Reservation'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string, required: true, description: 'Client token'
      parameter name: :id, in: :path, type: :integer
      response(200, 'successful') do
        let(:Authorization) { "Bearer #{@token}" }
        let(:id) { 1 }
        run_test!
      end
    end
  end
end
