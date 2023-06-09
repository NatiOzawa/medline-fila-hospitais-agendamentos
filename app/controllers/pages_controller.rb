class PagesController < ApplicationController
  before_action :authenticate_user!, only: :home
  def home
    @appointments = current_user.appointments.order(:time)
  end

  def index
  end
end
