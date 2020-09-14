class AddEstadoToTools < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :estado, :string
  end
end
