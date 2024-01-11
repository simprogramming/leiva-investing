module Admin
  class StocksController < ApplicationController
    before_action :set_stock, only: %i[edit update show destroy]
    before_action -> { authorize @stock || Stock }

    add_controller_helpers :stocks, only: :index
    decorates_assigned :stock, :stocks

    def index
      @stocks = policy_scope(Stock).order(:name)
      respond_to do |format|
        format.html # continue as normal for HTML requests
        format.json { render json: @stocks } # JSON response for API
      end
    end

    def show
      respond_to do |format|
        format.html
        format.json { render json: @stock }
      end
    end

    def new
      @stock = Stock.new
    end

    def edit
    end

    def create
      @stock = Stock.new(permitted_attributes(Stock))

      if @stock.save
        respond_to do |format|
          format.html { redirect_to [:admin, @stock], notice: 'Stock was successfully created.' }
          format.json { render json: @stock, status: :created }
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @stock.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      if @stock.update(permitted_attributes(stock))
        respond_to do |format|
          format.html { redirect_to [:admin, @stock], notice: 'Stock was successfully updated.' }
          format.json { render json: @stock }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @stock.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @stock.destroy
      respond_to do |format|
        format.html { redirect_to admin_stocks_path, notice: 'Stock was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_stock
      @stock = policy_scope(Stock).find(params[:id])
    end
  end
end
