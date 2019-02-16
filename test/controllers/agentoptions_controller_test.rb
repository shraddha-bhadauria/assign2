require 'test_helper'

class AgentoptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agentoptions_index_url
    assert_response :success
  end

end
