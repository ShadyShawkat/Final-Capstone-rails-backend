require 'swagger_helper'

RSpec.describe 'api/hotels', type: :request do
  path '/hotels' do
    get('list hotels') do
      consumes 'application/json'
      produces 'application/json'
      response(200, 'successful') do
        run_test!
      end
    end

    post 'creates a hotel successfully' do
      tags 'Hotels'
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :hotel, in: :body, schema: {
        type: :object,
        properties: { name: { type: :string }, description: { type: :text }, rating: { type: :integer },
                      image: { type: :string }, location: { type: :string }, user_id: { type: :string } },
        required: %w[name description rating image location user_id]
      }

      response '201', 'hotel created' do
        let(:hotel) do
          { name: 'Hilto', description: 'Nice place.', rating: 5, image: 'Hilton hotel image', location: 'New York',
            user_id: '2' }
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
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :integer
      response(200, 'successful') do
        run_test!
      end
    end

    delete('deletes a hotel') do
      tags 'Hotels'
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :integer
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
