Rails.application.routes.draw do
  resources :users, only: [
    :create,
    :index,
    :destroy,
    :update,
    :show
  ] do

    collection do
      get 'find_by_name', to: 'users#find_by_name'
      get 'find_by_email', to: 'users#find_by_email'
      get 'find_by_name_email', to: 'users#find_by_name_and_email'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index" # Descomentar si tienes una ruta raíz definida.
end