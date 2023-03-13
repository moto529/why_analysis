# frozen_string_literal: true

Rails.application.routes.draw do
  resources :analyses, only: %i[new create show] do
    resources :is_whies, only: %i[new create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
