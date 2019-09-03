require 'test_helper'

class AssembliesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get assemblies_edit_url
    assert_response :success
  end

  test "should get update" do
    get assemblies_update_url
    assert_response :success
  end

end
