class Sucursal < ApplicationRecord
  belongs_to :locality
  has_many :horarios, dependent: :destroy
  has_many :turns, dependent: :destroy

  validates :nombre, uniqueness: { case_sensitive: false }
  validates :nombre, :direccion, :tel, :locality_id, presence: true 

  def self.localities_sucursal(locality)
    Sucursal.all.where(locality_id: locality)     
  end

  def self.dia_horario(turno)
    if turno.date.to_date > DateTime.now.to_date
      horarios = Horario.where(sucursal_id: turno.sucursal_id) 
      horarios.each do |hora|
        if hora.dia = turno.date.strftime("%A").downcase
          turno.date.strftime("%H:%M").between?(hora.desde.strftime("%H:%M"),hora.hasta.strftime("%H:%M"))
        end
      end
    end

  end

  def self.chequeo_eliminar(suc)
    User.where(sucursals_id: suc)
  end

end
