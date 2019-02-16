require 'test_helper'

class OptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get options_index_url
    assert_response :success
  end

end
