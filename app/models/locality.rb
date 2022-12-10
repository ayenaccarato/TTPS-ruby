class Locality < ApplicationRecord
    has_many :sucursal #optional: true

    validates :name, uniqueness: { case_sensitive: false }
    validates :province, presence: true

    enum :province, [ :buenos_aires, :catamarca, :chaco, :chubut, :cordoba, :corrientes, :entre_rios, :formosa, :jujuy, :la_pampa, :la_rioja, :mendoza, 
    :misiones, :neuquen, :rio_negro, :salta, :san_juan, :san_luis, :santa_cruz, :santa_fe, :santiago_del_estero, :tierra_del_fuego, :tucuman]
end
