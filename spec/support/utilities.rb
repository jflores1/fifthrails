module ValidUserRequestHelper
	def sign_in_via_form
	@user = FactoryGirl.create(:user)
	visit new_user_session_path
	fill_in_login_form
	end

	private
	def fill_in_login_form
		fill_in "Email", 		with: @user.email
		fill_in "Password", with: @user.password
		click_button "Sign in"
	end
end


