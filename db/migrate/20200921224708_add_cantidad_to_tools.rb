class AddCantidadToTools < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :cantidad, :integer
  end
end
