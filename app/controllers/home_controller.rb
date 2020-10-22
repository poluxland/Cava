class HomeController < ApplicationController
  def index
    @insumos_orders = InsumosOrder.where("cantidad > 0").last(5)
    @elementos_orders = ElementosOrder.where("cantidad > 0").last(5)
    @tools_orders = ToolsOrder.where(status: true).last(5)
  end

  def terms
  end

  def privacy
  end


end
