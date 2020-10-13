Rails.application.routes.draw do
  scope "(:locale)", locale: /vi|en/ do
    #Route for user
    scope module: :user do
      root 'homes#index'
    end
    #==========================================================================
    #==========================================================================
    # Route for admin
    scope "/system", uag: true do
      devise_for :administrators
    end
    scope module: :admin, as: :system do
      scope "/system", uag: true do
        get 'login', to: 'homes#redirect_to_login', as: :redirect_to_login
        get 'home', to: 'homes#index', as: :dashboard
      end
    end
  end
end
