namespace :db_status do
  desc "See Users db Status"
  task count_users: :environment do
    if User.all.limit(5).empty?
      puts "0 Users on Database"
    else
      puts User.all.limit(20000).count.to_s + " Users on Database"
    end
  end

  desc "See Doctors db Status"
  task count_doctors: :environment do
    if Doctor.all.limit(5).empty?
      puts "0 Doctors on Database"
    else
      puts Doctor.all.limit(20000).count.to_s + " Doctors on Database"
    end
  end

  desc "See Clinics db Status"
  task count_clinics: :environment do
    if Clinic.all.limit(5).empty?
      puts "0 Farms on Database"
    else
      puts Clinic.all.limit(20000).count.to_s + " Clinics on Database"
    end
  end

  desc "See Appointments db Status"
  task count_appointments: :environment do
    if Appointment.all.limit(5).empty?
      puts "0 Samples on Database"
    else
      puts Appointment.all.limit(20000).count.to_s + " Appointments on Database"
    end
  end

  desc "Run All status"
  task all: :environment do
    Rake::Task['db_status:count_users'].execute
    Rake::Task['db_status:count_doctors'].execute
    Rake::Task['db_status:count_clinics'].execute
    Rake::Task['db_status:count_appointments'].execute
  end
end
