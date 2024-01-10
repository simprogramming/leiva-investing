module Admin
  class ApplicationController < ::ApplicationController
    include LocaleHelper
    before_action :authenticate_user!

    layout "admin/layouts/application"

    private

    def configure_permitted_parameters
      # Add extra permitted columns to devise for registration
      base_attrs = %i[email]
      # devise_parameter_sanitizer.permit(:invite, keys: base_attrs + [:role])
      # devise_parameter_sanitizer.permit(:accept_invitation, keys: base_attrs)
      devise_parameter_sanitizer.permit(:sign_up, keys: base_attrs)
    end
  end
end
