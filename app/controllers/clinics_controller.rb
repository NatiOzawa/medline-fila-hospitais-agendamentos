class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.all
    if params[:query].present?
      sql_subquery = <<~SQL
        clinics.name ILIKE :query
        OR clinics.address ILIKE :query
      SQL
      @clinics = @clinics.where(sql_subquery, query: "%#{params[:query]}%")
    end
    user_coordinates = [current_user.lat, current_user.long]
    @clinics = @clinics.sort_by do |clinic|
      n = NavigationService.new(clinic.long, clinic.lat, current_user.long, current_user.lat)
      n.calculate
      n.distance
    end
  end

end
