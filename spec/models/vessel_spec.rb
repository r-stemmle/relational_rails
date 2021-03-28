require 'rails_helper'

RSpec.describe Vessel do
  describe 'relationships' do
    it {should belong_to :marina}
  end
end
