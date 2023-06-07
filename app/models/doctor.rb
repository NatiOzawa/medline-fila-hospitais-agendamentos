class Doctor < ApplicationRecord
  belongs_to :clinic
  has_many :appointments
  SPECIALTIES = %w[ Cardiologia
  Dermatologia
  Endocrinologia
  Gastroenterologia
  Geriatria
  Ginecologia
  Hematologia
  Infectologia
  Nefrologia
  Neurologia
  Oftalmologia
  Ortopedia
  Otorrinolaringologia
  Pediatria
  Psiquiatria
  Radiologia
  Reumatologia
  Urologia
  Cirurgia Geral
  Cirurgia Plástica ]
end
