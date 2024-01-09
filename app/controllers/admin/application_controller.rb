module Admin
  class ApplicationController < ::ApplicationController
    include LocaleHelper

    layout "admin/layouts/application"
  end
end
