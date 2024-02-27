class Api::V1::BorrowHistoriesController < ApplicationController
    before_action :set_history, only: [:show, :update, :destroy]

    
    def index
        @histories = BorrowHistory.includes(:book, :library_patron)                                    
                                  .select("borrow_histories.id, borrow_histories.borrow_date, borrow_histories.book_id, borrow_histories.library_patron_id")
                                  .order("borrow_histories.created_at" => :desc)
                                  .where(instore: false)
      
        render json: @histories.as_json(
          include: {
            book: { only: [:title] }, 
            library_patron: { only: [:firstname, :lastname] } 
          }
        )
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