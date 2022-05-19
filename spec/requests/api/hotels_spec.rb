require 'swagger_helper'

RSpec.describe 'api/hotels', type: :request do
  before :each do
    post '/auth/login', params: { email: 'admin@gmail.com', password: 'admin' }
    @token = JSON.parse(response.body)['token']
  end

  path '/hotels' do
    get('list hotels') do
      tags 'Hotels'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string, required: true, description: 'Client token'
      response(200, 'successful') do
        let(:Authorization) { "Bearer #{@token}" }
        run_test!
      end
    end

    post 'creates a hotel successfully' do
      tags 'Hotels'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string, required: true, description: 'Client token'
      parameter name: :hotel, in: :body, schema: {
        type: :object,
        properties: { name: { type: :string }, description: { type: :text }, rating: { type: :integer },
                      image: { type: :string }, location: { type: :string }, user_id: { type: :integer }, rooms: { type: :multi } },
        required: %w[name description rating image location user_id]
      }

      response '201', 'hotel created' do
        let(:Authorization) { "Bearer #{@token}" }
        let(:hotel) do
          { name: 'Hilto', description: 'Nice place.', rating: 5, image: 'Hilton hotel image', location: 'New York',
            user_id: 2, rooms: [{ id: 1, image: 'image', price: 1000 }] }
        end
        run_test!
      end
    end
  end

  path '/hotels/{id}' do
    get('gets a hotel') do
      tags 'Hotels'
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

    delete('deletes a hotel') do
      tags 'Hotels'
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
