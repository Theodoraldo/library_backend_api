class Api::V1::AttendancesController < ApplicationController
    before_action :set_attendance, only: [:show, :update, :destroy]

    
    def index
        @attendances = Attendance.where(check_out: nil)
        render json: @attendances
    end

    def show
        render json: @attendance
    end

    def create
        @attendance = Attendance.new(attendance_params)

        if @attendance.save
        render json: @attendance, status: :created
        else
        render json: @attendance.errors, status: :unprocessable_entity
        end
    end

    def update
        if @attendance.update(attendance_params)
        render json: @attendance
        else
        render json: @attendance.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @attendance.destroy
        head :no_content
    end

  
    private
  
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    
    def attendance_params
        params.require(:attendance).permit(:check_in, :check_out, :library_patron_id)
    end

end
