class Api::V1::LibraryPatronsController < ApplicationController
    before_action :set_patron, only: [:show, :update, :destroy]

    
    def index
        @patrons = LibraryPatron.all
        render json: @patrons
    end

    def show
        render json: @patron
    end

    def create
        @patron = LibraryPatron.new(patron_params)

        if @patron.save
        render json: @patron, status: :created
        else
        render json: @patron.errors, status: :unprocessable_entity
        end
    end

    def update
        if @patron.update(patron_params)
        render json: @patron
        else
        render json: @patron.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @patron.destroy
        head :no_content
    end

  
    private
  
    def set_patron
      @patron = LibraryPatron.find(params[:id])
    end

    
    def patron_params
        params.require(:library_patron).permit(:firstname, :lastname, :email, :contact, :location, :city, :state, :identity_card, :identity_no, :address)
    end
end