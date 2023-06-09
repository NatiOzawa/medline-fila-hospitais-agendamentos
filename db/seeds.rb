require 'faker'

Doctor.destroy_all
Appointment.destroy_all
Clinic.destroy_all
User.destroy_all



user_lat = [
  29.72934166, 29.64637014, 29.77063353, 29.72323923, 29.92033796,
  29.72255567, 29.7093368, 29.74811613, 29.71118515, 29.71098236,
  29.70703136, 29.81073566, 30.01436876, 29.5548362, 30.0188957,
  30.02458106, 30.026944, 30.0245794, 29.78775625, 29.96646877]

user_long = [
  -95.59448362, -95.45758019, -95.20029102, -95.38702269, -95.61340961,
  -95.3875319, -95.39403896, -95.36614814, -95.39433336, -95.3945517,
  -95.39707717, -95.43033555, -95.44076914, -95.116592, -95.44394499,
  -95.44853039, -95.449853, -95.44534571, -95.69305012, -95.55114453]

clinic_lat = [29.92712973, 30.02365626, 29.92440962, 29.62414628, 29.58248474]

clinic_long = [-95.58969896, -95.44027493, -95.58824613, -95.14260386, -95.20742117]


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

5.times do
  clinic = Clinic.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    lat: clinic_lat.sample,
    long: clinic_long.sample
  )
  clinic.save!
end

10.times do
  doctor = Doctor.new(
    name: Faker::Name.name,
    specialty: Doctor::SPECIALTIES.sample,
    crm: Faker::Number.number(digits: 6),
    clinic_id: Clinic.pluck(:id).sample
  )
  doctor.save!
end

30.times do
  appointment = Appointment.new(
    user_id: User.pluck(:id).sample,
    doctor_id: Doctor.pluck(:id).sample,
    time: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now + 30, format: :default),
    status: ['Agendado', 'Realizado', 'Cancelado'].sample,
    clinic_id: Clinic.pluck(:id).sample,
    emergency: [true, false].sample,
    date_position: Faker::Number.between(from: 1, to: 20)
  )
  appointment.save!
end
