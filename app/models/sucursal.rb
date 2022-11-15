class Sucursal < ApplicationRecord
    validates :nombre, uniqueness => true, :direccion, :tel, :localidad, presence: true
    
    enum rol: ["Administrador", "Pesonal Bancario", "Cliente"]
end
