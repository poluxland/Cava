class Insumo < ApplicationRecord
  has_many :insumos_orders

  validates :cantidad, presence: true
  validates :nombre, presence: true

  def total_disponible
    cantidad - InsumosOrder.where(insumo_id: id, status: true).sum(&:cantidad)
  end
end
