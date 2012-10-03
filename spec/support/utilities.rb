def sign_in(user)
  visit signin_path
  fill_in "Email Address", with: user.email_address
  fill_in "Password", with: user.password
  click_button "Sign In"

  cookies[:remember_token] = user.remember_token
end