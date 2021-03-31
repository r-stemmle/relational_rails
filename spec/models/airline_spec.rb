require 'rails_helper'

describe Airline, type: :model do

  describe 'relationships' do
    it { should have_many :pilots }
  end
end