class AddNumeroDeValeToElementosOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :elementos_orders, :numero_de_vale, :integer
  end
end
