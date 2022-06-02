require "rails_helper"

RSpec.describe "Creating a kitten", type: :system do
  context "with valid inputs" do
    it "creates a new kitten" do
      visit new_kitten_path

      fill_in "Name", with: "Honey"
      fill_in "Age", with: 5
      fill_in "Softness", with: 9
      fill_in "Cuteness", with: 7

      click_on "Add Kitten"

      expect(page).to have_content("Kittens")
    end
  end

  context "with invalid inputs" do
    it "re-renders the #new view" do
      visit new_kitten_path

      click_on "Add Kitten"

      expect(page).to have_content("New Kitten")
    end
  end
end
