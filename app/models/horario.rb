class Horario < ApplicationRecord
  belongs_to :sucursal
  has_and_belongs_to_many :sucursal, optional: true

  validates :dia, uniqueness: {scope: :sucursal_id}

  enum :dia, [:monday, :tuesday, :wednesday, :thursday, :friday]
  
end
