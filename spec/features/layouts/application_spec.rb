require 'rails_helper'

RSpec.describe 'layouts/application' do
  describe 'at the top of any page, there is a link to the pilots index' do
    it 'displays pilots link' do
      visit '/airlines'

      click_link 'Pilots'

      expect(current_path).to eq('/pilots')
    end
  end
end