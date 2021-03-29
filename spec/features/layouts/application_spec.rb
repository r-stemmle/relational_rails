require 'rails_helper'

RSpec.describe 'layouts/application' do
  describe 'at the top of any page, there are links to the airlines and pilots  index' do
    it 'displays pilots link' do
      visit '/airlines'
      
      click_link 'Pilots'

      expect(current_path).to eq('/pilots')
    end

    it 'displays airlines link' do
      visit '/pilots'

      click_link 'Airlines'

      expect(current_path).to eq('/airlines')
    end
  end
end