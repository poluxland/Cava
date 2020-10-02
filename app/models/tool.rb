class Tool < ApplicationRecord
  has_many :tools_orders

  def total_disponible
    
    cantidad - ToolsOrder.where(tool_id: id, status: true).sum(&:cantidad)
    
  end
end
