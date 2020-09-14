class CreateToolsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :tools_orders do |t|
      t.integer :cantidad
      t.string :responsable
      t.boolean :status
      t.references :tool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
