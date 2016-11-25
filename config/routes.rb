QuickBlog::Application.routes.draw do

  get  'about' =>'static_pages#about'
  get  'help' =>'static_pages#help'
  get  'contact' => 'static_pages#contact'


  get 'static_pages/home'

  #Users  
  resources :users, :only => [:new, :create, :show, :edit, :update]
  #get 'users' => 'users#index'          #display a list of all users
  #get 'users/new' => 'users#new'        #html form for creating a new user
  #post 'users' => 'users#create'        #create a new user
  #get 'users/:id' => 'users#show'       #display a specific user
  #get 'users/:id/edit' => 'users#edit'  #html form for editing a user
  #put 'users/:id' => 'photos#update'    #update a specific user
  #delete 'users/:id' => 'photos#destroy' #delete a specific user
  
  #Posts
  resources :posts, :only => [:index, :new, :create, :show, :edit, :update] do
    #Nested Comments
    resources :comments, :only => [:create]
  end
 

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'



  root 'posts#index'

  #catch all to send undefined routes to the root page
  get "*path" => redirect("/")


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  #Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
