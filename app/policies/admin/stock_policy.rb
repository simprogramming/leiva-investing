module Admin
  class StockPolicy < ApplicationPolicy
    include AdminBasePolicy

    def update_prices?
      user.admin?
    end
    def permitted_attributes
      %i[name symbol price status dividend yield distribution position api_symbol]
    end
  end
end
