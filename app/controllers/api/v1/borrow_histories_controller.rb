class Api::V1::BorrowHistoriesController < ApplicationController
    before_action :set_history, only: [:show, :update, :destroy]

    
    def index
        @histories = BorrowHistory.order(created_at: :desc).all
        render json: @histories
    end

    def show
        render json: @history
    end

    def create
        @history = BorrowHistory.new(history_params)

        if @history.save
        render json: @history, status: :created
        else
        render json: @history.errors, status: :unprocessable_entity
        end
    end

    def update
        if @history.update(history_params)
        render json: @history
        else
        render json: @history.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @history.destroy
        head :no_content
    end

  
    private
  
    def set_history
      @history = BorrowHistory.find(params[:id])
    end

    
    def history_params
        params.require(:borrow_history).permit(:borrow_date, :returned_date, :book_state, :instore, :comment, :library_patron_id, :book_id, :user_id)
    end
end