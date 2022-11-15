class Horario < ApplicationRecord
  belongs_to :sucursal

  enum dia: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"]
  
  def self.get_dias
    {
      "Lunes" => "Lunes",
      "Martes" => "Martes",
      "Miércoles" => "Miércoles",
      "Jueves" => "Jueves",
      "Viernes" => "Viernes"
    }
  end

  def self.get_desde
    {
     
    }
  end
end
