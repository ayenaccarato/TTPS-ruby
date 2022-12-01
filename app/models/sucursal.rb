class Sucursal < ApplicationRecord
  belongs_to :locality
  #has_many :horarios

  validates :nombre, :direccion, :tel, :locality_id, presence: true 
end
