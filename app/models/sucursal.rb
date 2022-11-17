class Sucursal < ApplicationRecord
    validates :nombre, :direccion, :tel, :localidad, presence: true
    
    
end
