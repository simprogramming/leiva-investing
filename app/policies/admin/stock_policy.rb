module Admin
  class StockPolicy < ApplicationPolicy
    include AdminBasePolicy

    def permitted_attributes
      %i[name symbol price status]
    end
  end
end
