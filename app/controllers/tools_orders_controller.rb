class ToolsOrdersController < ApplicationController
  before_action :set_tools_order, only: [:show, :edit, :update, :destroy]

  # GET /tools_orders
  # GET /tools_orders.json
  def index
    if params[:tool_id].nil?
      @tools_orders = ToolsOrder.all
    else
      @tools_orders = ToolsOrder.where(tool_id: params[:tool_id])
    end
  end

  # GET /tools_orders/1
  # GET /tools_orders/1.json
  def show
  end

  # GET /tools_orders/new
  def new
    @tool = Tool.find(params[:tool_id])
    @tools_order = @tool.tools_orders.build
  end

  # GET /tools_orders/1/edit
  def edit
    @tool = Tool.find(params[:tool_id])
  end

  # POST /tools_orders
  # POST /tools_orders.json
  def create

    @tools_order = ToolsOrder.new(tools_order_params)
    @tools_order.tool_id = params[:tool_id]
    @tools_order.status = true
    @tool = @tools_order.tool
    if @tools_order.save
      redirect_to tool_path(params[:tool_id]), notice: 'Orden creada correctamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /tools_orders/1
  # PATCH/PUT /tools_orders/1.json
  def update      
    if params[:tool_id].nil?
      if @tools_order.status
        @tools_order.status = false
        @tools_order.order_end = Date.today
      else
        @tools_order.status = true
      end      
      if @tools_order.save
        redirect_to tool_path(@tools_order.tool), notice: 'Estado de orden actualizada'
      else
        render tool_path(@tools_order.tool)
      end
    else
      respond_to do |format|
        if @tools_order.update(tools_order_params)
          format.html { redirect_to tool_path(@tools_order.tool), notice: "Orden de #{@tools_order.responsable} actualizada" }
          format.json { render :show, status: :ok, location: @tools_order }
        else
          format.html { render :edit }
          format.json { render json: @tools_order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /tools_orders/1
  # DELETE /tools_orders/1.json
  def destroy
    @tools_order.destroy
    respond_to do |format|
      format.html { redirect_to tools_orders_url, notice: 'Orden eliminado.' }
      format.json { head :no_content }
    end
  end

  def cambiar_estado
    raise
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tools_order
      @tools_order = ToolsOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tools_order_params
      params.require(:tools_order).permit(:cantidad, :responsable, :status, :tool_id)
    end
end
