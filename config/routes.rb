Rails.application.routes.draw do
  scope "(:locale)", locale: /vi|en/ do
    root 'homes#index'
  end
end
