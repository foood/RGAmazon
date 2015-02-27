RGAmazon::Application.routes.draw do



  devise_for :users, :controllers => { registrations: 'registrations',:omniauth_callbacks => "users/omniauth_callbacks" }




  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    root to: 'home#index'

    resources :books
    resources :authors
    resources :categories
    resources :users, only: [:edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update, :edit]
    resources :adresses
    resource :cart, only: [:show]
    resources :order_items, only: [:create, :update, :destroy]

  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  get '', to: redirect("/#{I18n.default_locale}")
  # match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), via: :all
  # match '', to: redirect("/#{I18n.default_locale}"), via: :all
  # match "/users/auth/:provider", constraints: { provider: /google|facebook/ }, to: "devise/omniauth_callbacks#passthru", as: :omniauth_authorize, via: [:get, :post]
  # match "/users/auth/:action/callback", constraints: { action: /google|facebook/ }, to: "devise/omniauth_callbacks", as: :omniauth_callback, via: [:get, :post]
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
