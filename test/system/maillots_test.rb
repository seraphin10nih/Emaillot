require "application_system_test_case"

class MaillotsTest < ApplicationSystemTestCase
  setup do
    @maillot = maillots(:one)
  end

  test "visiting the index" do
    visit maillots_url
    assert_selector "h1", text: "Maillots"
  end

  test "creating a Maillot" do
    visit maillots_url
    click_on "New Maillot"

    fill_in "Description", with: @maillot.description
    fill_in "Image Url", with: @maillot.image_url
    fill_in "Price", with: @maillot.price
    fill_in "Title", with: @maillot.title
    click_on "Create Maillot"

    assert_text "Maillot was successfully created"
    click_on "Back"
  end

  test "updating a Maillot" do
    visit maillots_url
    click_on "Edit", match: :first

    fill_in "Description", with: @maillot.description
    fill_in "Image Url", with: @maillot.image_url
    fill_in "Price", with: @maillot.price
    fill_in "Title", with: @maillot.title
    click_on "Update Maillot"

    assert_text "Maillot was successfully updated"
    click_on "Back"
  end

  test "destroying a Maillot" do
    visit maillots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maillot was successfully destroyed"
  end
end
