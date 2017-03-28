Rails.application.routes.draw do

  get  "/"                   => "sessions#index"
  get "/sessions/new"        => "sessions#new"
  post "/sessions/create"    => "sessions#create"
  delete "/sessions/destroy" => "sessions#destroy"

  post "/drivers/create"     => "drivers#create"
  get "/drivers/:id/show"    => "drivers#show"
  get "/drivers/:id/index"   => "drivers#index"

  post "/riders/create"      => "riders#create"
  get "/riders/:id/index"    => "riders#index"
  get "/riders/:id/show"     => "riders#show"

  get "/trips/new"           => "trips#new"
  post "/trips/create"       => "trips#create"
  get "/trips/:id/edit"      => "trips#edit"
  patch "/trips/:id"         => "trips#update"
  delete "/trips/:id"         => "trips#destroy"

  get "/cars/new"            => "cars#new"
  post "/cars/create"        => "cars#create"

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

  # Example resource route with options:
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