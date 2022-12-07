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
end
