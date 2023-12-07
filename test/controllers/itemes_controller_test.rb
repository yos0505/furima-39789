require "test_helper"

class ItemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get itemes_index_url
    assert_response :success
  end
end
