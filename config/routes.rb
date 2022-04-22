Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, defaults: { format: :json },
                     path: '',
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       registration: 'signup'
                     },
                     controllers: {
                       sessions: 'sessions',
                       registrations: 'registrations'
                     }

  namespace :api do
    resources :greetings, only: [:index, :create]
  end

  root to: 'application#website'
  get '/panel(/*path)', to: 'application#panel', as: :panel
  get '/(*path)', to: 'application#website', as: :website
end
