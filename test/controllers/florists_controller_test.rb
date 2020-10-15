require 'test_helper'

class FloristsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get florists_show_url
    assert_response :success
  end
end
