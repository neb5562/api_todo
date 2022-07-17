Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show create update destroy]

      resources :tokens, only: %i[create]

      resources :projects, only: %i[show create update destroy] do
        resources :tasks, only: %i[create]
      end

      delete "/tokens", to: "tokens#log_out"
    end
  end
end
