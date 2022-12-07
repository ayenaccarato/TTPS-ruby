class Horario < ApplicationRecord
  belongs_to :sucursal

  validates :dia, uniqueness: {scope: :sucursal_id}

  enum :dia, [:monday, :tuesday, :wednesday, :thursday, :friday]

  def self.horarios_suc (suc)
    Horario.where(sucursal_id: suc)
  end
  
end
