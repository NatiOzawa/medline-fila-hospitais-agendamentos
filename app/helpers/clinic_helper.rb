module ClinicHelper
  def self.show_address(latitude,longitude)
    results = Geocoder.search([latitude, longitude])
    if results.first
      results.first.address
    else
      "Endereço não encontrado"
    end
  end
end
