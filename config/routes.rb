Rails.application.routes.draw do
  resources :analyses, only: %i[new create] do
    resources :is_whies, only: %i[new create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
