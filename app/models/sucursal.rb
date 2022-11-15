class Sucursal < ApplicationRecord
    validates :nombre, :direccion, :tel, :localidad, presence: true
    
    enum rol: ["Administrador", "Pesonal Bancario", "Cliente"]
end
