controller :admin do
  get "/", action: :admin, as: :admin
end

resources :users
resources :stocks
root "admin#admin"
