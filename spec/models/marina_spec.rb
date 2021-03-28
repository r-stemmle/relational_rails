require 'rails_helper'

RSpec.describe Marina do
  describe 'relationships' do
    it { should have_many :vessels }
  end


end
