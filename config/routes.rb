SampleApp::Application.routes.draw do
  
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :transactions, :only => [:create, :destroy]

  match '/contact',   :to => 'pages#contact'
  match '/about',     :to => 'pages#about'
  match '/help',      :to => 'pages#help'
  match '/signup',    :to => 'users#new'
  match '/signin',    :to => 'sessions#new'
  match '/createandregisterscan', :to => 'users#createandregisterscan'
  match '/newscanuser', :to => 'users#newscanuser'
  match '/newscanuserregistered', :to => 'users#newscanuserregistered'
  match '/signout',    :to => 'sessions#destroy'

  match '/mbtest', :to => 'pages#mbtest'

  match '/serverdemo',  :to => 'pages#serverdemo'
  match '/clientdemo',  :to => 'pages#clientdemo'

  match '/paymentscan(/:amounttopay)',       
        :to => 'pages#paymentscan', :constraints => {:amounttopay => /[^\/]+/}
  match '/enterpayment',                   :to => 'pages#enterpayment'
  match '/paymentconfirmation/:id/:amounttopay',    
        :to => 'pages#paymentconfirmation', :constraints => {:amounttopay => /[^\/]+/}
  match '/paymentposted/:id/:amounttopay', 
        :to => 'pages#paymentposted', :constraints => {:amounttopay => /[^\/]+/}

  match '/checkin',     :to => 'pages#checkin'
  match '/scansuccess/:id', :to => 'pages#scansuccess'
  match '/scanin/:id', :to => 'pages#scanin'

  match '/bank_accounts', :to => 'pages#bank_accounts'
  match '/merchants', :to => 'pages#merchants'
  match '/edit_bank_info', :to => 'pages#edit_bank_info'
  match '/edit_merchant_info', :to => 'pages#edit_merchant_info'  
    
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
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
