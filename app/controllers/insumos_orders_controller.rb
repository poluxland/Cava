class InsumosOrdersController < ApplicationController
  before_action :set_insumos_order, only: [:show, :edit, :update, :destroy]

  # GET /insumos_orders
  # GET /insumos_orders.json
  def index
    if params[:insumo_id].nil?
      @insumos_orders = InsumosOrder.all
    else
      @insumos_orders = InsumosOrder.where(insumo_id: params[:insumo_id])
    end
  end

  # GET /insumos_orders/1
  # GET /insumos_orders/1.json
  def show
  end

  # GET /insumos_orders/new
  def new
    @insumo = Insumo.find(params[:insumo_id])
    @insumos_order = @insumo.insumos_orders.build
  end

  # GET /insumos_orders/1/edit
  def edit
    @insumo = Insumo.find(params[:insumo_id])
  end

  # POST /insumos_orders
  # POST /insumos_orders.json
  def create

    @insumos_order = InsumosOrder.new(insumos_order_params)
    @insumos_order.insumo_id = params[:insumo_id]
    @insumos_order.status = true
    @insumo = @insumos_order.insumo
    if @insumos_order.save
      redirect_to insumo_path(params[:insumo_id]), notice: 'Orden creada correctamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /insumos_orders/1
  # PATCH/PUT /insumos_orders/1.json
  def update
    if params[:insumo_id].nil?
      if @insumos_order.status
        @insumos_order.status = false
        @insumos_order.order_end = Date.today
      else
        @insumos_order.status = true
      end
      if @insumos_order.save
        redirect_to insumo_path(@insumos_order.insumo), notice: 'Estado de orden actualizada'
      else
        render insumo_path(@insumos_order.insumo)
      end
    else
      respond_to do |format|
        if @insumos_order.update(insumos_order_params)
          format.html { redirect_to insumo_path(@insumos_order.insumo), notice: "Orden de #{@insumos_order.responsable} actualizada" }
          format.json { render :show, status: :ok, location: @insumos_order }
        else
          format.html { render :edit }
          format.json { render json: @insumos_order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /insumos_orders/1
  # DELETE /insumos_orders/1.json
  def destroy
    @insumos_order.destroy
    respond_to do |format|
      format.html { redirect_to insumos_orders_url, notice: 'Orden eliminado.' }
      format.json { head :no_content }
    end
  end

  def cambiar_estado
    raise
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insumos_order
      @insumos_order = InsumosOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insumos_order_params
      params.require(:insumos_order).permit(:cantidad, :responsable, :status, :insumo_id)
    end
end
