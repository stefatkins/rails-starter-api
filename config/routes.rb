Rails.application.routes.draw do
  def api_resources(name)
    resources name, except: [:new, :edit]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, skip: [:sessions, :registrations, :passwords]
      devise_scope :user do
        post   'users/sign_up',   to: 'devise/registrations#create'
        post   'users/sign_in',   to: 'devise/sessions#create'
        delete 'users/sign_out',  to: 'devise/sessions#destroy'
        post   'users/password',  to: 'devise/passwords#create'
        patch  'users/password',  to: 'devise/passwords#update'
      end
      api_resources :users
    end
  end
end
