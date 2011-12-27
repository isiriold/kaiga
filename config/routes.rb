ActionController::Routing::Routes.draw do |map|
  map.resources :receipt_voucher_entries

  map.resources :inventory_items

  map.resources :inventory_groups

  map.resources :inventory_unit_of_measurements

  map.resource :user_session
  
  map.resource :user_account, :controller => "users"
  map.resources :users  
  
  map.resources :account_transactions

  map.resources :transactions

  map.resources :accounts
  
  map.resources :accounting_periods
  map.resources :accounting_days, :collection => {:close => :put}

  map.resources :account_sub_groups

  map.resources :account_main_groups

  map.resources :account_groups
  
  map.resources :ledgers
  map.resource  :trial_balance
  map.resource  :day_book
  map.resource  :profit_and_loss_statement

  # The priority is based upon order of creation: first created -> highest priority.

  map.resources :account_group_types
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
