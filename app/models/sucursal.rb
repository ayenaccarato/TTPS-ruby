class Sucursal < ApplicationRecord
  belongs_to :locality
  has_and_belongs_to_many :horario, optional: true
  has_many :horarios


  validates :nombre, :direccion, :tel, :locality_id, presence: true 

  def self.localities_sucursal(locality)
    Sucursal.all.where(locality_id: locality)     
  end

  def self.dia_horario(turno)
    horarios = Horario.where(sucursal_id: turno.sucursal_id) 
    horarios.each do |hora|
      if hora.dia = turno.date.strftime("%A").downcase
        turno.date.strftime("%H:%M").between?(hora.desde.strftime("%H:%M"),hora.hasta.strftime("%H:%M"))
      end
    end

  end

end
