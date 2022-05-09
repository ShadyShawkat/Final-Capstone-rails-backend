require 'test_helper'

class HotelsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get hotels_index_url
    assert_response :success
  end

  test 'should get show' do
    get hotels_show_url
    assert_response :success
  end

  test 'should get create' do
    get hotels_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get hotels_destroy_url
    assert_response :success
  end
end
