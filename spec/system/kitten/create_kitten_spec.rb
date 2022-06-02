require "rails_helper"

RSpec.describe "Creating a kitten", type: :system do
  context "with valid inputs" do
    it "creates a new kitten" do
      visit new_kitten_path

      fill_in "Name", with: "Honey"
      select "5", from: "Age"
      select "9", from: "Softness"
      select "7", from: "Cuteness"

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
