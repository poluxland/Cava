class Elemento < ApplicationRecord
  has_many :elementos_orders

  validates :cantidad, presence: true
  validates :nombre, presence: true

  def total_disponible
    cantidad - ElementosOrder.where(elemento_id: id, status: true).sum(&:cantidad)
  end
end
