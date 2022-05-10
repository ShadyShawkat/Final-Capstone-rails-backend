require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  path '/reservations' do
    get('List reservations') do
      consumes 'application/json'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end

    post 'Creates a reservation successfully' do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: { date: { type: :date }, hotel_room_id: { type: :integer }, user_id: { type: :integer } },
        required: %w[date hotel_room_id]
      }

      response '201', 'reservation created' do
        let(:reservation) do
          { date: '2022-05-11', hotel_room_id: 2, user_id: '2' }
        end
        run_test!
      end
    end
  end
end
