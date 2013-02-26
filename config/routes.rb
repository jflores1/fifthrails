Fifthrails::Application.routes.draw do

  devise_for :users

  root to:'storage_rental#business'

  resources :addresses, :items, :order_items, :admin, :storage_rental, :quotes

  resources :users do
    resources :addresses
    resources :items
    resources :orders
    resources :order_items
  end

  resources :orders do
    resources :order_items
    member do
      put :complete_order
    end
  end

  #storage_rental matchers
  match '/how_it_works',               to: 'storage_rental#how_it_works'
  match '/pricing',                    to: 'storage_rental#pricing'
  match '/frequently_asked_questions', to: 'storage_rental#faq'
  match '/storage_quote',              to: 'storage_rental#quote'
  match '/home',                       to: 'storage_rental#home'
  match '/business',                   to: 'storage_rental#business'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
