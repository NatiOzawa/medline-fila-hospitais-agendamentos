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
  end

end
