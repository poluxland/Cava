class AddUnidadToElementosOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :elementos_orders, :unidad, :string
  end
end
