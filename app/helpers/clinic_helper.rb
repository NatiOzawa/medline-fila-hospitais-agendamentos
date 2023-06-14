module ClinicHelper
  def self.show_address(latitude,longitude)
    results = Geocoder.search([latitude, longitude])
    if results.first
      "#{results.first.street}, #{results.first.house_number.nil? || results.first.house_number.empty? ? 'S/N' : results.first.house_number} - #{results.first.city} - #{results.first.state}"
    else
      "Endereço não encontrado"
    end
  end
end
