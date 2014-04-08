Truffe::Application.routes.draw do
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

  match 'signup',  :to => 'users#new'
  match 'signin',  :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  match 'profile' => 'index#profile'
  match 'news' => 'articles#index'
  match 'photos' => 'index#photos'
  match 'contacts' => 'index#contacts'
  match 'send_inquiry' => 'index#send_inquiry'
  match 'gigs/:year(/:month)' => 'gigs#index', :constraints => { :year => /\d{4}/ }
  match 'sitemap', :to => redirect('/sitemap.xml')

  namespace :admin do
    resources :index, :users, :gigs, :discographies
  end

  resources :login do
    collection do 
      post :login
      get 'logout'
    end
  end

  resources :users
  resources :articles
  resources :gigs
  resources :discographies
  resources :blog_entries
  resources :sessions, :only => [:new, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

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
  root :to => 'index#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
