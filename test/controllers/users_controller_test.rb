require_relative '../test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: 'Santiago', email: 'a@gmail.com', password: '123456')
    post auth_login_path({ email: 'a@gmail.com', password: '123456' }), as: :json
    token = JSON.parse(response.body)['token']
  end

  test 'should get index' do
    assert_response :success
  end

  test 'should create user' do
    post users_path({ name: 'Whatever', email: 'b@gmail.com', password: '123456' })
    assert_response :created
  end
end
