require 'faker'

require 'csv'

Doctor.destroy_all
Appointment.destroy_all
Clinic.destroy_all
User.destroy_all

file_path = Rails.root.join('lib', 'seeds', 'hospitais_curitiba.csv')
file = File.open(file_path, 'r')

CSV.foreach(file, headers: :first_row, col_sep: ';') do |row|
  clinic = Clinic.create!(
    name: row["NOME FANTASIA"].capitalize ,
    address: row["address"].capitalize ,
    phone: Faker::PhoneNumber.phone_number,
    lat: row["LATITUDE"].to_f,
    long: row["LONGITUDE"].to_f,
    emergency_time: rand(15..45)
  )
  5.times do
    doctor = Doctor.new(
      name: Faker::Name.name,
      specialty: Doctor::SPECIALTIES.sample,
      crm: Faker::Number.number(digits: 6),
      clinic: clinic
    )
    doctor.save!
  end
end

user_lat = [
  -25.50838, -25.50792, -25.50515, -25.50207, -25.49719,
  -25.49154, -25.49121, -25.48998, -25.48979, -25.48879,
  -25.48496, -25.48482, -25.48457, -25.48258, -25.48162,
  -25.48024, -25.47888, -25.47673, -25.47655, -25.47502
]

user_long = [
  -49.26969, -49.30433, -49.32498, -49.28972, -49.30346,
  -49.26042, -49.3087, -49.28301, -49.236, -49.22336,
  -49.30228, -49.21186, -49.32535, -49.33529, -49.24638,
  -49.33687, -49.27295, -49.31636, -49.21804, -49.34356
 ]

# clinic_lat = [-22.42, -22.786, -22.38166, -22.84772, -22.73808 ]

# clinic_long = [-44.29, -43.312, -41.77388, -43.47152, -42.84874 ]


20.times do |i|
  result = Geocoder.search([user_lat[i], user_long[i]]).first
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 75),
    address: "#{result.street}, #{result.house_number.nil? || result.house_number.empty? ? 'S/N' : result.house_number} - #{result.state}",
    phone: Faker::PhoneNumber.phone_number,
    email: "teste#{i+1}@teste.com",
    password: "123123",
    health_insurance: Faker::Company.name,
    lat: user_lat[i],
    long: user_long[i]
  )
  user.save!
end

# 5.times do
#   clinic = Clinic.new(
#     name: Faker::Company.name,
#     address: Faker::Address.full_address,
#     phone: Faker::PhoneNumber.phone_number,
#     lat: clinic_lat.sample,
#     long: clinic_long.sample
#   )
#   clinic.save!
# end

# 10.times do
#   doctor = Doctor.new(
#     name: Faker::Name.name,
#     specialty: Doctor::SPECIALTIES.sample,
#     crm: Faker::Number.number(digits: 6),
#     clinic: Clinic.all.sample
#   )
#   doctor.save!
# end

30.times do
  appointment = Appointment.new(
    user: User.all.sample,
    doctor: Doctor.all.sample,
    time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now + 30, format: :default),
    status: ['Agendado', 'Realizado', 'Cancelado'].sample,
    clinic: Clinic.all.sample,
    emergency: [true, false].sample,
    date_position: Faker::Number.between(from: 1, to: 20)
  )
  appointment.save!
end
