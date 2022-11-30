class Sucursal < ApplicationRecord
    
    #has_many :horario
    validates :nombre, :direccion, :tel, :localidad, presence: true    
    
end
