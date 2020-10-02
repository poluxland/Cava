class Tool < ApplicationRecord
  has_many :tools_orders

  validates :cantidad, presence: true
  validates :nombre, presence: true

  def total_disponible
    cantidad - ToolsOrder.where(tool_id: id, status: true).sum(&:cantidad)
  end
end
