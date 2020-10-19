class ElementosOrder < ApplicationRecord
  belongs_to :elemento

  validates :cantidad, numericality: true

end
