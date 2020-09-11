class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :nombre
      t.integer :valor
      t.boolean :disponible
      t.string :bodega

      t.timestamps
    end
  end
end
