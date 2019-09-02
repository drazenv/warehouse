require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get products_all_url
    assert_response :success
  end

end
