class HomeController < ApplicationController
  def index
    @insumos_orders = InsumosOrder.where("cantidad > 0").last(5)
    @elementos_orders = ElementosOrder.where("cantidad > 0").last(5)
    @tools_orders = ToolsOrder.where(status: true)
    @insumos0 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).sum("insumos_orders.cantidad * insumos.valor")
    @insumos1 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 1.month)..((Date.today.end_of_month) - 1.month)).sum("insumos_orders.cantidad * insumos.valor")
    @insumos2 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 2.month)..((Date.today.end_of_month) - 2.month)).sum("insumos_orders.cantidad * insumos.valor")
    @insumos3 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 3.month)..((Date.today.end_of_month) - 3.month)).sum("insumos_orders.cantidad * insumos.valor")
    @insumos4 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 4.month)..((Date.today.end_of_month) - 4.month)).sum("insumos_orders.cantidad * insumos.valor")
    @insumos5 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 5.month)..((Date.today.end_of_month) - 5.month)).sum("insumos_orders.cantidad * insumos.valor")
    @insumos6 = InsumosOrder.where("insumos_orders.cantidad > ?", 0).joins(:insumo).where(created_at: ((Date.today.beginning_of_month) - 6.month)..((Date.today.end_of_month) - 6.month)).sum("insumos_orders.cantidad * insumos.valor")
    @elementos0 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: Date.today.beginning_of_month..Date.today.end_of_month).sum("elementos_orders.cantidad * elementos.valor")
    @elementos1 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 1.month)..((Date.today.end_of_month) - 1.month)).sum("elementos_orders.cantidad * elementos.valor")
    @elementos2 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 2.month)..((Date.today.end_of_month) - 2.month)).sum("elementos_orders.cantidad * elementos.valor")
    @elementos3 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 3.month)..((Date.today.end_of_month) - 3.month)).sum("elementos_orders.cantidad * elementos.valor")
    @elementos4 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 4.month)..((Date.today.end_of_month) - 4.month)).sum("elementos_orders.cantidad * elementos.valor")
    @elementos5 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 5.month)..((Date.today.end_of_month) - 5.month)).sum("elementos_orders.cantidad * elementos.valor")
    @elementos6 = ElementosOrder.where("elementos_orders.cantidad > ?", 0).joins(:elemento).where(created_at: ((Date.today.beginning_of_month) - 6.month)..((Date.today.end_of_month) - 6.month)).sum("elementos_orders.cantidad * elementos.valor")


  end

  def ins
    @insumos_orders = InsumosOrder.where("insumos_orders.cantidad > ?", 0)
  end

  def epp
    @elementos_orders = ElementosOrder.where("elementos_orders.cantidad > ?", 0)
  end


end
