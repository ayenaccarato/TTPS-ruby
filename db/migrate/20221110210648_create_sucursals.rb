class CreateSucursals < ActiveRecord::Migration[7.0]
  def change
    create_table :sucursals do |t|
      t.string :nombre, uniqueness: true
      t.string :direccion
      t.string :tel
      t.string :localidad

      t.timestamps
    end
  end
end
