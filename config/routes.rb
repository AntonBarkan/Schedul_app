SampleApp::Application.routes.draw do
  #get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  get "users/new"
  get "scheduling/show"


  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'

  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/settings', to: 'users#settings',      via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/showall', to: 'static_pages#showall', via: 'get'

  match '/scheduling', to: 'scheduling#show', via: 'get'
  match '/scheduling', to: 'scheduling#show', via: 'post'
  match '/scheduling', to: 'scheduling#update', via: 'post'


  match '/full_position', to: 'users#full_time_table', via: 'get'
  match '/part_position', to: 'users#part_time_table', via: 'get'
  match '/allschedule', to: 'users#allschedule', via: 'get'
  match '/calendar', to: 'users#show_calendar', via: 'get'
  match '/chng_pass', to: 'users#change_password', via: 'get'


  #------------ajax calls
  post '/ajax/submit'      => 'users#submit'
  post '/ajax/submit_part' => 'users#submit_part'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   ghttps://mail.google.com/mail/u/0/?ui=2&ik=38492ea93b&view=att&th=1463a76e4fedf19e&attid=0.1&disp=safe&realattid=f_hvoaqjvp0&zwet 'products/:id' => 'catalog#view'
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
