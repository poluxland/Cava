class AddObservacionesToElementosOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :elementos_orders, :observaciones, :text
  end
end
