require 'rails_helper'

describe "As a user, when I visit '/'" do
  describe "I Select 'Griffindor' from the select field and click 'Search For Members'" do
    it "I am on '/search' and see a total members and a list of 18 members with their info" do
      visit root_path
      expect(current_path).to eq(root_path)

      page.select 'Gryffindor', from: 'house'
      click_on 'Search For Members'

      expect(current_path).to eq(search_path)
      expect(page).to have_content("21 Members")
      expect(page).to have_css(".member", count: 21)

      within(first('.member')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.role')
        expect(page).to have_css('.house')
        expect(page).to have_css('.patrounus')
      end
    end
  end
end
