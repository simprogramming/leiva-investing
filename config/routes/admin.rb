controller :admin do
  get "/", action: :admin, as: :admin
end

resources :daily_predictions
resources :users
resources :stocks
root "admin#admin"

namespace :api, defaults: { format: :json } do
  resources :stocks, only: %i[index show create update destroy]
end
