require "application_system_test_case"

class SucursalsTest < ApplicationSystemTestCase
  setup do
    @sucursal = sucursals(:one)
  end

  test "visiting the index" do
    visit sucursals_url
    assert_selector "h1", text: "Sucursals"
  end

  test "should create sucursal" do
    visit sucursals_url
    click_on "New sucursal"

    fill_in "Direccion", with: @sucursal.direccion
    fill_in "Localidad", with: @sucursal.localidad
    fill_in "Nombre", with: @sucursal.nombre
    fill_in "Tel", with: @sucursal.tel
    click_on "Create Sucursal"

    assert_text "Sucursal was successfully created"
    click_on "Back"
  end

  test "should update Sucursal" do
    visit sucursal_url(@sucursal)
    click_on "Edit this sucursal", match: :first

    fill_in "Direccion", with: @sucursal.direccion
    fill_in "Localidad", with: @sucursal.localidad
    fill_in "Nombre", with: @sucursal.nombre
    fill_in "Tel", with: @sucursal.tel
    click_on "Update Sucursal"

    assert_text "Sucursal was successfully updated"
    click_on "Back"
  end

  test "should destroy Sucursal" do
    visit sucursal_url(@sucursal)
    click_on "Destroy this sucursal", match: :first

    assert_text "Sucursal was successfully destroyed"
  end
end
