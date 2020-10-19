class CreateElementos < ActiveRecord::Migration[6.0]
  def change
    create_table :elementos do |t|
      t.integer :cantidad
      t.string :nombre
      t.integer :valor
      t.boolean :disponible
      t.string :bodega
      t.string :estado

      t.timestamps
    end
  end
end
