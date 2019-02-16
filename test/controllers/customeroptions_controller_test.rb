require 'test_helper'

class CustomeroptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customeroptions_index_url
    assert_response :success
  end

end
