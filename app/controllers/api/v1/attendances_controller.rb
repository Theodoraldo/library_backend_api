class Api::V1::AttendancesController < ApplicationController
    before_action :set_attendance, only: [:show, :update, :destroy]

    def index
        @attendances = Attendance.includes(:library_patron)
                                 .select("attendances.id", "DATE(attendances.check_in) AS check_in_date", "TO_CHAR(check_in, 'HH:MI:SS AM') AS check_in_time", "attendances.library_patron_id")
                                 .order("attendances.created_at DESC")
                                 .where(check_out: nil)
        
        render json: @attendances.as_json(
          include: {
            library_patron: { only: [:firstname, :lastname] } 
          }
        )
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
