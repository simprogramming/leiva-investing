module Admin
  class DailyPredictionsController < ApplicationController
    before_action :set_daily_prediction, only: %i[edit update show destroy]
    before_action -> { authorize @daily_prediction || DailyPrediction }

    add_controller_helpers :daily_predictions, only: :index
    decorates_assigned :daily_prediction, :daily_predictions

    def index
      @daily_predictions = policy_scope(DailyPrediction).order(:created_at)
    end

    def show
    end

    def new
      @daily_prediction = DailyPrediction.new
    end

    def edit
    end

    def create
      @daily_prediction = DailyPrediction.new(permitted_attributes(DailyPrediction))

      if @daily_prediction.save
        redirect_to [:admin, @daily_prediction], notice: create_successful_notice
      else
        render :new
      end
    end

    def update
      if @daily_prediction.update(permitted_attributes(daily_prediction))
        redirect_to [:admin, @daily_prediction], notice: update_successful_notice
      else
        render :edit
      end
    end

    def destroy
      @daily_prediction.destroy
      redirect_to admin_daily_predictions_path, notice: destroy_successful_notice
    end

    private

    def set_daily_prediction
      @daily_prediction = policy_scope(DailyPrediction).find(params[:id])
    end
  end
end
