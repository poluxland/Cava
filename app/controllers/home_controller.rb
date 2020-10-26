class HomeController < ApplicationController
  def index
    @insumos_orders = InsumosOrder.where("cantidad > 0").last(5)
    @elementos_orders = ElementosOrder.where("cantidad > 0").last(5)
    @tools_orders = ToolsOrder.where(status: true)
    @insumos0 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).sum("insumos_orders.cantidad * insumos.valor")
    @insumos1 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 1.month)..((Date.today.end_of_month) - 1.month)).sum("insumos_orders.cantidad * insumos.valor")
    @insumos2 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 2.month)..((Date.today.end_of_month) - 2.month)).sum("insumos_orders.cantidad * insumos.valor")
    @elementos0 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).sum("elementos_orders.cantidad * elementos.valor")
    @elementos1 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 1.month)..((Date.today.end_of_month) - 1.month)).sum("elementos_orders.cantidad * elementos.valor")
    @elementos2 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 2.month)..((Date.today.end_of_month) - 2.month)).sum("elementos_orders.cantidad * elementos.valor")
  end

  def ins
    @insumos_orders = InsumosOrder.where("insumos_orders.cantidad > ?", 0)
  end

  def epp
    @elementos_orders = ElementosOrder.where("elementos_orders.cantidad > ?", 0)
  end


end
