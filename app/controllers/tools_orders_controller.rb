class ToolsOrdersController < ApplicationController
  before_action :set_tools_order, only: [:show, :edit, :update, :destroy]

  # GET /tools_orders
  # GET /tools_orders.json
  def index
    @tools_orders = ToolsOrder.all
  end

  # GET /tools_orders/1
  # GET /tools_orders/1.json
  def show
  end

  # GET /tools_orders/new
  def new
    @tool = Tool.find(params[:tool_id])
    @tool_order = @tool.tools_orders.build
  end

  # GET /tools_orders/1/edit
  def edit
  end

  # POST /tools_orders
  # POST /tools_orders.json
  def create

    @tools_order = ToolsOrder.new(tools_order_params)
    @tools_order.tool_id = params[:tool_id]

    respond_to do |format|
      if @tools_order.save!
        format.html { redirect_to tool_tools_order_path(params[:tool_id], @tools_order), notice: 'Tools order was successfully created.' }
        format.json { render :show, status: :created, location: @tools_order }
      else
        format.html { render :new }
        format.json { render json: @tools_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tools_orders/1
  # PATCH/PUT /tools_orders/1.json
  def update
    respond_to do |format|
      if @tools_order.update(tools_order_params)
        format.html { redirect_to @tools_order, notice: 'Tools order was successfully updated.' }
        format.json { render :show, status: :ok, location: @tools_order }
      else
        format.html { render :edit }
        format.json { render json: @tools_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools_orders/1
  # DELETE /tools_orders/1.json
  def destroy
    @tools_order.destroy
    respond_to do |format|
      format.html { redirect_to tools_orders_url, notice: 'Tools order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tools_order
      @tools_order = ToolsOrder.find(params[:tool_id])
    end

    # Only allow a list of trusted parameters through.
    def tools_order_params
      params.require(:tools_order).permit(:retiro, :responsable, :status, :tool_id)
    end
end
