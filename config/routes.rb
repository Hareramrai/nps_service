Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :surveys, only: %i[index update]
    end
  end
end
