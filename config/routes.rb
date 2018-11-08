Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, skip: [:sessions, :registrations, :passwords]
      devise_scope :user do
        post   'users/sign_up',   to: 'devise/registrations#create'
        post   'users/sign_in',   to: 'devise/sessions#create'
        delete 'users/sign_out',  to: 'devise/sessions#destroy'
        post   'users/password',  to: 'devise/passwords#create'
        patch  'users/password',  to: 'devise/passwords#update'
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end

end
