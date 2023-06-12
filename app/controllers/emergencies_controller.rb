class EmergenciesController < ApplicationController

  def new
    @clinic = Clinic.find(params[:clinic_id])
    @appointment= Appointment.new
  end

  def create
    @appointment = Appointment.new
    @appointment.user = current_user
    @appointment.clinic = Clinic.find(params[:clinic_id])
    @appointment.body_area = params[:body_area]
    @appointment.pain_scale = params[:pain_scale]
    @appointment.additional_information = params[:additional_information]
    @appointment.emergency = true
    @appointment.time = Time.current.advance(minutes: 30)
    if @appointment.save
      flash[:notice] = "Emergência registrada com sucesso"
      redirect_to my_appointments_appointments_path
    else
      flash.now[:alert] = "Erro ao registrar a emergência"
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:body_area, :pain_scale, :additional_information)
  end

end
