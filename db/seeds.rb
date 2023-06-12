require 'faker'

require 'csv'

Doctor.destroy_all
Appointment.destroy_all
Clinic.destroy_all
User.destroy_all

file_path = Rails.root.join('lib', 'seeds', 'hospitais_rio_sp.csv')
file = File.open(file_path, 'r')

CSV.foreach(file, headers: :first_row, col_sep: ';') do |row|
  clinic = Clinic.create!(
    name: row["NOME FANTASIA"].capitalize ,
    address: row["address"].capitalize ,
    phone: Faker::PhoneNumber.phone_number,
    lat: row["LATITUDE"].to_f,
    long: row["LONGITUDE"].to_f
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
  -22.46545, -21.192, -22.117, -22.95649, -22.48589,
  -22.65326, -22.611, -22.74109, -22.94244, -22.61405,
  -22.41432, -22.48869, -22.99898, -21.74852, -22.7177,
  -22.463, -22.481, 22.3123, -21.42143, -22.67724
]

user_long = [
  -44.45686, -41.89575, -43.209, -42.99671, -43.84992,
  -43.03986, -43.709, -42.78112, -43.05622, -42.40762,
  -42.95041, -44.10899, -44.30399, -41.31133, -42.02144,
  -42.653, -42.204, 42.5848, -41.69448, -43.6054 ]

clinic_lat = [-22.42, -22.786, -22.38166, -22.84772, -22.73808 ]

clinic_long = [-44.29, -43.312, -41.77388, -43.47152, -42.84874 ]


20.times do |i|
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 75),
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    email: "teste#{i+1}@teste.com",
    password: "123123",
    health_insurance: Faker::Company.name,
    lat: user_lat.sample,
    long: user_long.sample
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
