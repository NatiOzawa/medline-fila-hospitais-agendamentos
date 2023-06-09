class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true
  belongs_to :clinic

  def self.next(user)
    user.appointments.where("time >= ?", Time.current).first
  end

  def self.history(user)
    user.appointments.where("time < ?", Time.current)
  end

  def self.upcoming(user)
    user.appointments.where("time >= ?", Time.current)
  end
end
