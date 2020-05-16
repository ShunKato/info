require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Comment", with: @product.comment
    fill_in "Cust", with: @product.cust
    fill_in "P code", with: @product.p_code
    fill_in "P name", with: @product.p_name
    fill_in "Supp", with: @product.supp
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @product.comment
    fill_in "Cust", with: @product.cust
    fill_in "P code", with: @product.p_code
    fill_in "P name", with: @product.p_name
    fill_in "Supp", with: @product.supp
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
