Rails.application.routes.draw do
  root   'sessions#new'
  # get    'users/:id' => 'users#index', as:"index"
  get    'signup' => 'users#new', as: "signup"
  get    'home'  => 'korrkred#home', as: "home"
  get    'subjects'  => 'korrkred#subjects'
  get    'semesters'  => 'korrkred#semesters'
  get    'semesters/:id' => 'korrkred#semesters_set', as: "semesters_set"
  post   'semesters/:id' => 'korrkred#add_subject_to_semester', as: "semesters_add_subject"
  post   'save_semesters' => 'korrkred#semesters_new', as: "save_semesters"
  post   'save_subject' => 'korrkred#subjects_new', as: "save_subject"
  post   'change_subject' => 'korrkred#change_subject', as: "change_subject"
  post   'change_semester/:id' => 'korrkred#change_semester', as: "change_semester"
  post   'delete_semester' => 'korrkred#delete_semester', as: "delete_semester"
  get    'application/change_locale/:locale' => 'application#change_locale', as: "change_locale"
  get    'login'   => 'sessions#new', as: "login"
  post   'login'   => 'sessions#create'
  get    'logout'  => 'sessions#destroy'
  resources :users

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
