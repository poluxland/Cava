class ToolsOrder < ApplicationRecord
  belongs_to :tool

  def persisted?
    
  end
end
