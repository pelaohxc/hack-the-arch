require 'test_helper'

class BracketsControllerTest < ActionController::TestCase
	def setup
		@non_admin = users(:archer)
		@bracket = brackets(:example_bracket)
	end

	test "should redirect edit when not logged in" do
    get :edit, id: @bracket
    assert_not flash.empty?
    assert_redirected_to login_url
  end

	test "should redirect edit when not logged in as admin" do
		log_in_as(@non_admin)
    get :edit, id: @bracket
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @bracket, bracket: { name: @bracket.name, priority: @bracket.priority }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in as admin" do
		log_in_as(@non_admin)
    patch :update, id: @bracket, bracket: { name: @bracket.name, priority: @bracket.priority }
    assert_not flash.empty?
    assert_redirected_to root_url
  end

end
