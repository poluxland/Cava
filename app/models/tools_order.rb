class ToolsOrder < ApplicationRecord
  belongs_to :tool

  validates :cantidad, numericality: true

end
