class ElementosOrdersController < ApplicationController
  before_action :set_elementos_order, only: [:show, :edit, :update, :destroy]

  # GET /elementos_orders
  # GET /elementos_orders.json
  def index
    if params[:elemento_id].nil?
      @elementos_orders = ElementosOrder.all
    else
      @elementos_orders = ElementosOrder.where(elemento_id: params[:elemento_id])
    end
  end

  # GET /elementos_orders/1
  # GET /elementos_orders/1.json
  def show
  end

  # GET /elementos_orders/new
  def new
    @elemento = Elemento.find(params[:elemento_id])
    @elementos_order = @elemento.elementos_orders.build
  end

  # GET /elementos_orders/1/edit
  def edit
    @elemento = Elemento.find(params[:elemento_id])
  end

  # POST /elementos_orders
  # POST /elementos_orders.json
  def create

    @elementos_order = ElementosOrder.new(elementos_order_params)
    @elementos_order.elemento_id = params[:elemento_id]
    @elementos_order.status = true
    @elemento = @elementos_order.elemento
    if @elementos_order.save
      redirect_to elemento_path(params[:elemento_id]), notice: 'Orden creada correctamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /elementos_orders/1
  # PATCH/PUT /elementos_orders/1.json
  def update
    if params[:elemento_id].nil?
      if @elementos_order.status
        @elementos_order.status = false
        @elementos_order.order_end = Date.today
      else
        @elementos_order.status = true
      end
      if @elementos_order.save
        redirect_to elemento_path(@elementos_order.elemento), notice: 'Estado de orden actualizada'
      else
        render elemento_path(@elementos_order.elemento)
      end
    else
      respond_to do |format|
        if @elementos_order.update(elementos_order_params)
          format.html { redirect_to elemento_path(@elementos_order.elemento), notice: "Orden de #{@elementos_order.responsable} actualizada" }
          format.json { render :show, status: :ok, location: @elementos_order }
        else
          format.html { render :edit }
          format.json { render json: @elementos_order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /elementos_orders/1
  # DELETE /elementos_orders/1.json
  def destroy
    @elementos_order.destroy
    respond_to do |format|
      format.html { redirect_to elementos_orders_url, notice: 'Orden eliminado.' }
      format.json { head :no_content }
    end
  end

  def cambiar_estado
    raise
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elementos_order
      @elementos_order = ElementosOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def elementos_order_params
      params.require(:elementos_order).permit(:cantidad, :responsable, :status, :elemento_id, :unidad)
    end
end
