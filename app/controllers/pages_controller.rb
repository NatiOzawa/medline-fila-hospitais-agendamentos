class PagesController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: :index

=======
  before_action :authenticate_user!, only: :home
>>>>>>> d89e106 (ok)
  def home
    @appointments = current_user.appointments.order(:time)
  end

  def index
  end
end
