class Appointment < ApplicationRecord
  attr_accessor :specialty

  belongs_to :user
  belongs_to :doctor, optional: true
  belongs_to :clinic

  serialize :body_areas, Array
  validates :additional_information, length: { maximum: 500 }

  def self.next(user)
    user.appointments.where("time >= ?", Time.current).order(:time).first
  end

  def self.history(user)
    user.appointments.where("time < ?", Time.current)
  end

  def self.upcoming(user)
    user.appointments.where("time >= ?", Time.current).order(:time)
  end
end
