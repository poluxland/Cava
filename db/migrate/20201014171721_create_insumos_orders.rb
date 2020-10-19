class CreateInsumosOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :insumos_orders do |t|
      t.integer :retiro
      t.string :responsable
      t.boolean :status
      t.integer :cantidad
      t.references :insumo, null: false, foreign_key: true
      t.date :order_end, precision: 6

      t.timestamps
    end
  end
end
