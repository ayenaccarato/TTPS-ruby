class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.datetime :date
      t.string :motive
      t.integer :status
      t.string :result
      t.references :sucursal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: {to_table: :users}
      t.references :employee, null: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
