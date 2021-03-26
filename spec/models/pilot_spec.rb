require 'rails_helper'

RSpec.describe Pilot do
  describe 'relationships' do
    it {should belong_to :airline}
  end
end