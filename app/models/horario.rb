class Horario < ApplicationRecord
  belongs_to :sucursal

  enum dia: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"]
  enum desde: [:hour, :minute]

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
      :hour => "Hora" => (0..23),
      :minute => "Minuto" => (0..59)
    }
  end
end
