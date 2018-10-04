Rails.application.routes.draw do
  root 'blogs#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :blogs, except: :index, shallow: true do
    resources :comments, only: [:create, :update, :destroy]
  end
end
