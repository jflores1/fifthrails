module OrdersHelper

	def show_user_pickups(user)
		if user.orders.active.pickup.count == 0
			content_tag :p, "You don't have any pickups scheduled."
		else
			render partial: 'orders/pickups'
		end
	end

	def show_user_deliveries(user)
		if user.orders.active.delivery.count == 0
			content_tag :p, "You don't have any deliveries scheduled."
		else
			render partial: 'orders/deliveries'
		end
	end
end
