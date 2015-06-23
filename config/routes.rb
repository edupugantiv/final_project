Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'users#welcome'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post 'charities/:id/donate' => 'charities#donate', as: :donate_charity
  get 'users/:id/history' => 'users#history', as: :user_history
  get 'users/welcome' => 'users#welcome'
  resources :users, :only => [:index, :show, :edit]
  get 'categories/initial' => 'categories#initial'
  get 'users/:id/next_update' => 'users#next_update', as: :user_next
  get 'users/:id/first_update' => 'users#first_update', as: :user_first
  get 'users/:id/update_monthly' => 'users#update_monthly', as: :user_monthly
  resources :categories, :only => [:index, :show]
  resources :preferences
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
