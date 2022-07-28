require 'test_helper'

class QuotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotation = quotations(:one)
  end

  test "should get index" do
    get quotations_url
    assert_response :success
  end

  test "should get new" do
    get new_quatation_url
    assert_response :success
  end

  test "should create quotation" do
    assert_difference('Quotation.count') do
      post quotations_url, params: { quotation: { address: @quotation.address, city: @quotation.city, email: @quotation.email, first_name: @quotation.first_name, last_name: @quotation.last_name, municiple_evaluation_of_property: @quotation.municiple_evaluation_of_property, phone: @quotation.phone, postal_code: @quotation.postal_code, province: @quotation.province } }
    end

    assert_redirected_to quatation_url(Quotation.last)
  end

  test "should show quotation" do
    get quatation_url(@quotation)
    assert_response :success
  end

  test "should get edit" do
    get edit_quatation_url(@quotation)
    assert_response :success
  end

  test "should update quotation" do
    patch quatation_url(@quotation), params: { quotation: { address: @quotation.address, city: @quotation.city, email: @quotation.email, first_name: @quotation.first_name, last_name: @quotation.last_name, municiple_evaluation_of_property: @quotation.municiple_evaluation_of_property, phone: @quotation.phone, postal_code: @quotation.postal_code, province: @quotation.province } }
    assert_redirected_to quatation_url(@quotation)
  end

  test "should destroy quotation" do
    assert_difference('Quotation.count', -1) do
      delete quatation_url(@quotation)
    end

    assert_redirected_to quotations_url
  end
end
