require 'faker'

Doctor.destroy_all
Appointment.destroy_all
Clinic.destroy_all
User.destroy_all

20.times do
  user = User.new(
    name: Faker::Name.name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 75),
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    health_insurance: Faker::Company.name,
    lat: Faker::Address.latitude,
    long: Faker::Address.longitude
  )
  user.save!
end

5.times do
  clinic = Clinic.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.phone_number,
    lat: Faker::Address.latitude,
    long: Faker::Address.longitude
  )
  clinic.save!
end

10.times do
  doctor = Doctor.new(
    name: Faker::Name.name,
    specialty: Faker::Job.title,
    crm: Faker::Number.number(digits: 6),
    clinic_id: Clinic.pluck(:id).sample
  )
  doctor.save!
end

30.times do
  appointment = Appointment.new(
    user_id: User.pluck(:id).sample,
    doctor_id: Doctor.pluck(:id).sample,
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
    status: ['Agendado', 'Realizado', 'Cancelado'].sample,
    clinic_id: Clinic.pluck(:id).sample,
    emergency: [true, false].sample,
    date_position: Faker::Number.between(from: 1, to: 20)
  )
  appointment.save!
end
