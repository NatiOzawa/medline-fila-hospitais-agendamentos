class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, optional: true
  belongs_to :clinic
end
