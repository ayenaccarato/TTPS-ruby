class Turn < ApplicationRecord
  belongs_to :sucursal
  belongs_to :user
  belongs_to :employee, class_name: "User", optional:true

  enum :status, [:pendiente, :cancelado, :finalizado]
end
