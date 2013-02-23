module AddressesHelper

	def show_addresses(user)
		if user.addresses.count > 0
			render partial: 'addresses/user_addresses'
		else
			content_tag :p, "You don't have any saved addresses yet."
		end
		
	end
end
