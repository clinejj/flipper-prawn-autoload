require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "articles returns 200" do
    get '/articles'
    assert_response :success
  end
end
