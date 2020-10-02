class AddFieldToToolsOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :tools_orders, :order_end, :date, precision: 6
  end
end
