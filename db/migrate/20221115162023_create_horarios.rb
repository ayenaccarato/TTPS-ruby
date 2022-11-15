class CreateHorarios < ActiveRecord::Migration[7.0]
  def change
    create_table :horarios do |t|
      t.references :sucursal, null: false, foreign_key: true
      t.string :dia
      t.time :desde
      t.time :hasta

      t.timestamps
    end
  end
end
