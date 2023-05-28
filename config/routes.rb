Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "guestbooks#show", as: :authenticated_root
  end

  root "static_pages#home"

  resources :guestbooks, only: %w[show] do
    resources :messages, only: %w[new create destroy]
  end

  get "/:username", to: "guestbooks#show"
end
