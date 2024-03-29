<<<<<<< HEAD
Courses::Application.routes.draw do

  get "omniauth_callbacks/facebook"

  get "omniauth_callbacks/vkontakte"

  namespace :admin do
       # Directs /admin/products/* to Admin::ProductsController
       # (app/controllers/admin/products_controller.rb)
    resources :users
    resources :courses
    resources :course_types
    root :to => 'base#index'
  end

  match 'courses' => 'courses#index', :as => :courses
  match 'courses/:slug' => 'courses#type', :as => :course_type
  match 'courses/:slug/:id/quiz(/:index)' => 'courses#quiz', :as => :course
  
  match 'courses/:slug/:id(/:index)' => 'courses#show', :as => :course
  #match 'courses/:id/edit' => 'courses#edit'
  

  devise_for :users, :path => 'account', :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => :registrations }
  match 'account' => 'users#index'
  resources :invitations
  #resources :articles
  #resources :practice
  
=======
Travis::Application.routes.draw do

  resources :ratings
  resources :rates

  get "pages/index"
>>>>>>> ab83d1ef940b0a3b251a9f3ad1c3b88f523bcdde

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
<<<<<<< HEAD
  root :to => 'home#index'
=======
  # root :to => 'welcome#index'
  root :to => 'rates#index'
>>>>>>> ab83d1ef940b0a3b251a9f3ad1c3b88f523bcdde

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
