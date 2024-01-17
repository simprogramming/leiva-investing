module Admin
  class DailyPredictionPolicy < ApplicationPolicy
    include AdminBasePolicy

    def permitted_attributes
      %i[date opening_price closing_price high low high_time low_time rationale status]
    end
  end
end
