require "application_system_test_case"

class ToolsOrdersTest < ApplicationSystemTestCase
  setup do
    @tools_order = tools_orders(:one)
  end

  test "visiting the index" do
    visit tools_orders_url
    assert_selector "h1", text: "Tools Orders"
  end

  test "creating a Tools order" do
    visit tools_orders_url
    click_on "New Tools Order"

    fill_in "Cantidad", with: @tools_order.cantidad
    fill_in "Responsable", with: @tools_order.responsable
    check "Status" if @tools_order.status
    fill_in "Tool", with: @tools_order.tool_id
    click_on "Create Tools order"

    assert_text "Tools order was successfully created"
    click_on "Back"
  end

  test "updating a Tools order" do
    visit tools_orders_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @tools_order.cantidad
    fill_in "Responsable", with: @tools_order.responsable
    check "Status" if @tools_order.status
    fill_in "Tool", with: @tools_order.tool_id
    click_on "Update Tools order"

    assert_text "Tools order was successfully updated"
    click_on "Back"
  end

  test "destroying a Tools order" do
    visit tools_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tools order was successfully destroyed"
  end
end
