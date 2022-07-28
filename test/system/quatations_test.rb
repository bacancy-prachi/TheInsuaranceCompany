require "application_system_test_case"

class QuotationsTest < ApplicationSystemTestCase
  setup do
    @quotation = quotations(:one)
  end

  test "visiting the index" do
    visit quotations_url
    assert_selector "h1", text: "Quotations"
  end

  test "creating a Quotation" do
    visit quotations_url
    click_on "New Quotation"

    fill_in "Address", with: @quotation.address
    fill_in "City", with: @quotation.city
    fill_in "Email", with: @quotation.email
    fill_in "First name", with: @quotation.first_name
    fill_in "Last name", with: @quotation.last_name
    fill_in "Municiple evaluation of property", with: @quotation.municiple_evaluation_of_property
    fill_in "Phone", with: @quotation.phone
    fill_in "Postal code", with: @quotation.postal_code
    fill_in "Province", with: @quotation.province
    click_on "Create Quotation"

    assert_text "Quotation was successfully created"
    click_on "Back"
  end

  test "updating a Quotation" do
    visit quotations_url
    click_on "Edit", match: :first

    fill_in "Address", with: @quotation.address
    fill_in "City", with: @quotation.city
    fill_in "Email", with: @quotation.email
    fill_in "First name", with: @quotation.first_name
    fill_in "Last name", with: @quotation.last_name
    fill_in "Municiple evaluation of property", with: @quotation.municiple_evaluation_of_property
    fill_in "Phone", with: @quotation.phone
    fill_in "Postal code", with: @quotation.postal_code
    fill_in "Province", with: @quotation.province
    click_on "Update Quotation"

    assert_text "Quotation was successfully updated"
    click_on "Back"
  end

  test "destroying a Quotation" do
    visit quotations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quotation was successfully destroyed"
  end
end
