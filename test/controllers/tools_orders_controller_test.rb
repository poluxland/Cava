require 'test_helper'

class ToolsOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tools_order = tools_orders(:one)
  end

  test "should get index" do
    get tools_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_tools_order_url
    assert_response :success
  end

  test "should create tools_order" do
    assert_difference('ToolsOrder.count') do
      post tools_orders_url, params: { tools_order: { cantidad: @tools_order.cantidad, responsable: @tools_order.responsable, status: @tools_order.status, tool_id: @tools_order.tool_id } }
    end

    assert_redirected_to tools_order_url(ToolsOrder.last)
  end

  test "should show tools_order" do
    get tools_order_url(@tools_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_tools_order_url(@tools_order)
    assert_response :success
  end

  test "should update tools_order" do
    patch tools_order_url(@tools_order), params: { tools_order: { cantidad: @tools_order.cantidad, responsable: @tools_order.responsable, status: @tools_order.status, tool_id: @tools_order.tool_id } }
    assert_redirected_to tools_order_url(@tools_order)
  end

  test "should destroy tools_order" do
    assert_difference('ToolsOrder.count', -1) do
      delete tools_order_url(@tools_order)
    end

    assert_redirected_to tools_orders_url
  end
end
