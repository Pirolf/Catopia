require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
  	get signup_path
  	assert_no_difference 'User.count' do 
  		post users_path, user: { name: "", 
  			email: "user@invalid", 
  			password: "foo", password_confirmation: "bar"}
  	end
  	# check that failed submission rerenders the new action
  	assert_template 'users/new'
  end
end
