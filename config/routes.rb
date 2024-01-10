Rails.application.routes.draw do
  devise_for :users

  concern :localizable do
    put :change_locale, controller: "application"
  end

  scope :admin, module: :admin, as: :admin do
    concerns :localizable
    draw :admin
  end

  scope "/", module: :web, as: :web do
    draw :web
  end

  get "*path", to: "web/sites#home", constraints: lambda { |request|
                                                    request.format.html? && !request.path.starts_with?("/admin")
                                                  }
end
