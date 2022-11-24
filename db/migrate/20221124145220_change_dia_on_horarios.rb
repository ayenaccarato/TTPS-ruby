class ChangeDiaOnHorarios < ActiveRecord::Migration[7.0]
  def change
    change_column(:horarios, :dia, :integer, default: 0)
  end
end
