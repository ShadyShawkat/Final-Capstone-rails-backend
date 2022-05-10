require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/users' do
    post 'creates an user successfully' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          image: { type: :string },
          admin: { type: :boolean }
        },
        required: %w[name email password]
      }

      response '201', 'user created' do
        let(:user) { { name: 'james bond', email: 'james007@gmail.com', password: '007007' } }
        run_test!
      end
    end
  end

  path '/auth/login' do
    post 'logs in an existing user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'user logged in' do
        let(:user) { { email: 'admin@gmail.com', password: 'admin' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    delete 'deletes an existing user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :integer

      response(200, 'success') do
        run_test!
      end
    end
  end
end
