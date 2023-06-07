class PagesController < ApplicationController
  def home
    @appointments = Appointment.where(user: current_user)

  def index
  end
end
