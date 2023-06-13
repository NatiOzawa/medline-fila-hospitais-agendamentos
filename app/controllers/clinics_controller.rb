class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.near([current_user.current_lat, current_user.current_long], 200, units: :km)
    if params[:query].present?
      sql_subquery = <<~SQL
        clinics.name ILIKE :query
        OR clinics.address ILIKE :query
      SQL
      @clinics = Clinic.where(sql_subquery, query: "%#{params[:query]}%")

    elsif params[:filter].present?
      if params[:filter] == "time"
        @clinics = @clinics.sort_by do |clinic|
          n = NavigationService.new(clinic.long, clinic.lat, current_user.current_long, current_user.current_lat)
          n.calculate
          clinic.emergency_time + (n.duration/60).round(0)
        end
      elsif params[:filter] == "distance"
        @clinics = @clinics.sort_by do |clinic|
          n = NavigationService.new(clinic.long, clinic.lat, current_user.current_long, current_user.current_lat)
          n.calculate
          n.distance
        end
      end
    elsif params[:address].present?
      results = Geocoder.search(params[:address])
      current_user.update_attribute("current_lat", results.first.coordinates[0] ) if results.first.coordinates
      current_user.update_attribute("current_long", results.first.coordinates[1] ) if results.first.coordinates
      @clinics = Clinic.near([current_user.current_lat, current_user.current_long], 200, units: :km)
      @clinics = @clinics.sort_by do |clinic|
        n = NavigationService.new(clinic.long, clinic.lat, current_user.long, current_user.lat)
        n.calculate
        clinic.emergency_time + (n.duration/60).round(0)
      end

    elsif params[:latitude].present? && params[:longitude].present?
      current_user.update_user_location(params[:latitude], params[:longitude])
      redirect_to clinics_path(precision: true), notice: "Localização atualizada"
    else
      @clinics = @clinics.sort_by do |clinic|
        n = NavigationService.new(clinic.long, clinic.lat, current_user.long, current_user.current_lat)
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
