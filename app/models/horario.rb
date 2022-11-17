class Horario < ApplicationRecord
  belongs_to :sucursal

  enum dia: ["lunes", "martes", "miercoles", "jueves", "viernes"]
  
  def self.get_dias
    {
      "lunes" => "Lunes",
      "martes" => "Martes",
      "miercoles" => "Miércoles",
      "jueves" => "Jueves",
      "viernes" => "Viernes"
    }
  end
end
