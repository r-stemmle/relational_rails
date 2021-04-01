require 'rails_helper'
# User Story 3, Child Index (x2)
RSpec.describe "As a visitor" do
  describe "When I visit vessels path" do
    it 'has each vessel in the system with attributes' do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )

      visit "/vessels"
      expect(page).to have_content('Zinzi')
      expect(page).to have_content('Sabre')
      expect(page).to have_content(36)
      expect(page).to have_content('Mast up')
    end
  end

  # User Story 15, Child Index only shows `true` Records (x2)
  describe "When I visit all vessels" do
    it "I only see the records where the mast is up" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )
      smbs.vessels.create!(
          name: 'Shorty',
          make: 'Viking',
          length_overall: 34,
          mast_up: false
      )

      visit '/vessels'
      expect(page).to have_content('Zinzi')
      expect(page).to have_no_content('Shorty')
    end
  end

# User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
  describe "When I visit the marinas vessels index page" do
    it "I see a link to sort vessels in alphabetical order" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )
      smbs.vessels.create!(
          name: 'Shorty',
          make: 'Viking',
          length_overall: 34,
          mast_up: false
      )

      visit "/marinas/#{smbs.id}/vessels"
      click_on "Sort"
      expect(current_path).to eq("/marinas/#{smbs.id}/vessels_sorted")
      expect(page).to have_content('Shorty')
      expect(page).to have_content('Zinzi')
    end
  end

# User Story 18, Child Update From Childs Index Page (x1)
  describe 'When I visit all vessels or parents vessels index' do
    it "I see a edit link to click and arrive at edit page" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )
      smbs.vessels.create!(
          name: 'Shorty',
          make: 'Viking',
          length_overall: 34,
          mast_up: false
      )

      visit "/vessels"
      click_on "Edit #{zinzi.id}"
      expect(current_path).to eq("/vessels/#{zinzi.id}/edit")
    end
  end

#   User Story 21, Display Records Over a Given Threshold (x2)
  describe 'visit the marina-vessels page I see a form to input a number' do
    it "I click submit to only return vessels greater than 'n' length" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )
      shorty = smbs.vessels.create!(
          name: 'Shorty',
          make: 'Viking',
          length_overall: 34,
          mast_up: false
      )

      visit "/marinas/#{smbs.id}/vessels"
      expect(page).to have_content("#{shorty.name}")
      fill_in "Only show vessels with length greater than", with: 35
      click_on 'Save'
      expect(current_path).to eq("/marinas/#{smbs.id}/vessels")
      expect(page).to have_no_content("#{shorty.name}")
    end
  end
# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.


end
