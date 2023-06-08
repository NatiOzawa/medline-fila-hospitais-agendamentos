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

def show
  @appointment = Appointment.find(params[:id])
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

def specialties
  @target = params[:target]
  @doctors = Doctor.where(specialty: params[:specialty])
  @clinics = @doctors.map { |doctor| doctor.clinic }

  respond_to do |format|
    format.turbo_stream
  end
end

def clinics
  @target = params[:target]
  @doctor = Doctor.find(params[:doctor])
  @clinic = Clinic.where(id: @doctor.clinic_id)

  respond_to do |format|
    format.turbo_stream
  end
end

private

def appointment_params
  params.require(:appointment).permit(:time, :status, :emergency, :date_position, :screening)
end

end
