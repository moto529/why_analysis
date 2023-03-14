# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'analyses#new'
  resources :analyses, only: %i[new create show] do
    resources :is_whies, only: %i[new create]
    member do
      get 'csv_download'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
