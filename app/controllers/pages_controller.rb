class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def home
    @appointments = current_user.appointments.order(:time)
  end

  def index
  end
end
