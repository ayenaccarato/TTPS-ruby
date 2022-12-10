class Turn < ApplicationRecord
  belongs_to :sucursal
  belongs_to :user
  belongs_to :employee, class_name: "User", optional:true

  validates :sucursal_id, presence: true 
  validates :user_id, presence: true 
  validates :date, presence: true 
  validates :motive, presence: true

  enum :status, [:pendiente, :cancelado, :atendido]

  def self.turns_sucursal(sucursal)
    Turn.all.where(sucursal_id: sucursal, status: 'pendiente')     
  end

  def self.validar_fecha_hora(date, id_suc)
    date = date.to_datetime
    if date.to_date > DateTime.now.to_date
      p horarios = Horario.where(sucursal_id: id_suc) 
      horarios.each do |hora|
        if hora.dia = date.strftime("%A").downcase
          return date.strftime("%H:%M").between?(hora.desde.strftime("%H:%M"),hora.hasta.strftime("%H:%M"))
        else 
          return false
        end
      end
    else 
      return false
    end
  end

  def self.turns_personal(personal)
    Turn.where('employee_id:? OR user_id:?', personal, personal)
  end

  def self.eliminar(turnos)
    if !turnos.empty?
      turnos.each do |turn|
        turn.destroy
      end
    end
  end

end
