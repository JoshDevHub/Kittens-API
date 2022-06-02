require "rails_helper"

RSpec.describe "Updating a kitten", type: :system do
  let(:kitten) { Kitten.create(name: "Honey", age: 8, softness: 5, cuteness: 7) }

  context "when the inputs are valid" do
    it "updates the kitten" do
      visit edit_kitten_path(kitten)

      select "9", from: "Age"

      click_on "Add Kitten"

      expect(page).to have_content("Kittens")
    end
  end

  context "when the inputs are invalid" do
    it "re-renders the #edit view" do
      visit edit_kitten_path(kitten)

      fill_in "Name", with: ""

      click_on "Add Kitten"

      expect(page).to have_content("Update Kitten")
    end
  end
end
