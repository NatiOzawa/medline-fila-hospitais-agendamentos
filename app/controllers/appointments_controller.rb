class AppointmentsController < ApplicationController

def new
  @appointment = Appointment.new
end

def create
  @appointment = Appointment.new(appointment_params)
  @appointment.user = current_user
  if @appointment.save
    redirect_to my_appointments_path
  else
    render "new", status: :unprocessable_entity
  end
end

def index
  @appointments = Appointment.all
end

def destroy
  @appointment = Appointment.find(params[:id])
  if @appointment.user == current_user
    @appointment.destroy
    redirect_to my_appointments_path
  end
end

def history
  @appointments = Appointment.where(user: current_user, status: "Realizado")
end

def my_appointments
  @appointments = Appointment.where(user: current_user)
end


private

def appointment_params
  params.require(:appointment).permit(:time, :status, :emergency, :date_position, :screening)
end

end
