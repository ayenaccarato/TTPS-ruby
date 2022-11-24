class Horario < ApplicationRecord
  belongs_to :sucursal

  validates :dia, uniqueness: {scope: :sucursal_id}

  enum :dia, [:lunes, :martes, :miercoles, :jueves, :viernes]
  


end
