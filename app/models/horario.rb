class Horario < ApplicationRecord
  belongs_to :sucursal

  validates :dia, uniqueness: {scope: :sucursal_id}

  enum :dia, [:monday, :tuesday, :wednesday, :thursday, :friday]

  def self.horarios_suc (suc)
    Horario.where(sucursal_id: suc)
  end

  def self.validar_datos(inicio, fin)
    inicio = inicio.split(':')
    fin = fin.split(':')
    p fin[0] > inicio[0]
    return fin[0] > inicio[0]
  end

  def self.sucursal_horarios(id_s)
    Horario.where(sucursal_id: id_s)
  end
end
