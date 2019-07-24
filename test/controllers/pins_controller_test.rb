require 'test_helper'

class PinsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get pins_edit_url
    assert_response :success
  end

end
