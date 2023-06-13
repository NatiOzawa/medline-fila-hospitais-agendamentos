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


    if params[:filter].present?
      if params[:filter] == "time"
        @clinics = Clinic.near([current_user.lat, current_user.long], 200, units: :km).sort_by do |clinic|
          n = NavigationService.new(clinic.long, clinic.lat, current_user.long, current_user.lat)
          n.calculate
          clinic.emergency_time + (n.duration/60).round(0)
        end
      elsif params[:filter] == "distance"
        @clinics = Clinic.near([current_user.lat, current_user.long], 200, units: :km).sort_by do |clinic|
          n = NavigationService.new(clinic.long, clinic.lat, current_user.long, current_user.lat)
          n.calculate
          n.distance
        end
      end
    else
      @clinics = Clinic.near([current_user.lat, current_user.long], 200, units: :km).sort_by do |clinic|
        n = NavigationService.new(clinic.long, clinic.lat, current_user.long, current_user.lat)
        n.calculate
        clinic.emergency_time + (n.duration/60).round(0)
      end
    end

    # unless params[:latitude].nil? && params[:longitude].nil?
    #   @clinics = Clinic.near([params[:latitude], params[:longitude]], 200, units: :km).sort_by do |clinic|
    #     n = NavigationService.new(clinic.long, clinic.lat, params[:longitude], params[:latitude])
    #     n.calculate
    #     n.duration
    #   end
    # end
    # @clinics = Clinic.near([current_user.lat, current_user.long], 200, units: :km).sort_by do |clinic|
    #   n = NavigationService.new(clinic.long, clinic.lat, current_user.long, current_user.lat)
    #   n.calculate
    #   n.duration
    # end
  end
end
