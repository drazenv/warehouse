require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get articles_all_url
    assert_response :success
  end

end
