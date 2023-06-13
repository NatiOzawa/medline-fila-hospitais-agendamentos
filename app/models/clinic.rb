class Clinic < ApplicationRecord
  has_many :appointments
  has_many :doctors

  geocoded_by :address, latitude: :lat, longitude: :long

end
