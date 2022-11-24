class CreateHorarios < ActiveRecord::Migration[7.0]
  def change
    create_table :horarios do |t|
      t.references :sucursal, null: false, foreign_key: true
      t.string :dia, null:false
      t.time :desde
      t.time :hasta

      t.timestamps
    end
    add_index :horarios, [:sucursal_id, :dia], unique: true
  end
end
