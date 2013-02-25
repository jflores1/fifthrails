module ApplicationHelper
	
	def nav_form_or_menu
		if signed_in?
			render partial: 'layouts/header_user_dropdown'
		else
			render partial: 'forms/form_inline_signin'
		end
	end
	
end
