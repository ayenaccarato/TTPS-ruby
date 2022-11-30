class CreateLocalities < ActiveRecord::Migration[7.0]
  def change
    create_table :localities do |t|
      t.integer :province
      t.string :name
      t.references :sucursal, null: true, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
