Rails.application.routes.draw do
  scope :admin, module: :admin, as: :admin do
    draw :admin
  end

  scope "/", module: :web, as: :web do
    draw :web
  end
end
