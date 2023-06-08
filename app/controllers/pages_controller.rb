class PagesController < ApplicationController
  def home
    @appointments = current_user.appointments.order(:time)
  end

  def index
  end
end
