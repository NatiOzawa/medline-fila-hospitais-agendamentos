class PagesController < ApplicationController
  def home
    @appointments = Appointment.where(user: current_user)
  end
  def index
  end
end
