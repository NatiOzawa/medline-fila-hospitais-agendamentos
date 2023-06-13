class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address, latitude: :lat, longitude: :long
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :update_current_location
  # before_save :update_current_location , if: :will_save_change_to_lat? || :will_save_change_to_long?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :doctors, through: :appointments

  def update_current_location
    self.update_attribute("current_lat", self.lat)
    self.update_attribute("current_long", self.long)
  end

  def update_user_location(latitude, longitude)
    self.update_attribute("current_lat", latitude)
    self.update_attribute("current_long", longitude)
  end


end
