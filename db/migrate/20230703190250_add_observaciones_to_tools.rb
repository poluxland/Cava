class AddObservacionesToTools < ActiveRecord::Migration[6.1]
  def change
    add_column :tools, :observaciones, :integer
  end
end
