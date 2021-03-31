require 'rails_helper'
# User Story 20, Child Delete (x2)
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
RSpec.describe "Child Delete" do
  describe 'As a visitor to the vessel index page' do
    it "has a link to delete vessel that I click" do
      smbs = Marina.create!(name: "St. Marys Boat Services", city: "St. Marys", state: "GA", has_boat_ramp: false, low_tide_depth: 3, high_tide_depth: 9, created_at: "2021-03-27 17:37:52")
      zinzi = smbs.vessels.create!(
          name: 'Zinzi',
          make: 'Sabre',
          length_overall: 36,
          mast_up: true
      )

      visit '/vessels'
      click_on 'Delete Vessel'

      expect(current_path).to eq('/vessels')
      expect(page).to have_no_content("#{zinzi.name}")
    end
  end
end
