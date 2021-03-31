require 'rails_helper'

RSpec.describe 'airline story 1: parent index', type: :feature do
  it 'can list the names of each airline record in the system' do
    alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                               fleet_size: 83,
                               is_mainline_passenger: true)
    fedex = Airline.create!(name: 'Fedex',
                               fleet_size: 124,
                               is_mainline_passenger: false)
    
    visit "/airlines"

    expect(page).to have_content(alaska_airlines.name)
    expect(page).to have_content(fedex.name)
  end
end

RSpec.describe 'airline story 2: parent show', type: :feature do
  it 'can list the attributes of the specified airline id' do
    alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                               fleet_size: 83,
                               is_mainline_passenger: true)
    fedex = Airline.create!(name: 'Fedex',
                               fleet_size: 124,
                               is_mainline_passenger: false)
    
    
    visit "/airlines/#{alaska_airlines.id}"
    expect(page).to have_content(alaska_airlines.name)
    expect(page).to have_content(alaska_airlines.fleet_size)
    expect(page).to have_content(alaska_airlines.is_mainline_passenger)
    expect(page).to have_content(alaska_airlines.created_at.strftime("%m/%d/%Y %I:%M %p"))
    expect(page).to have_content(alaska_airlines.updated_at.strftime("%m/%d/%Y %I:%M %p"))

    visit "/airlines/#{fedex.id}"
    expect(page).to have_content(fedex.name)
    expect(page).to have_content(fedex.fleet_size)
    expect(page).to have_content(fedex.is_mainline_passenger)
    expect(page).to have_content(fedex.created_at.strftime("%m/%d/%Y %I:%M %p"))
    expect(page).to have_content(fedex.updated_at.strftime("%m/%d/%Y %I:%M %p"))
    end
  end
    
  RSpec.describe 'airline story 6: airline index sorted', type: :feature do
    it 'can list and display the airlines by their created_at timestamp' do
    alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                                      fleet_size: 83,
                                      is_mainline_passenger: true
                                      )
    fedex = Airline.create!(name: 'Fedex',
                            fleet_size: 124,
                            is_mainline_passenger: false
                            )
                            
    alaska_airlines.created_at = "2021-03-27 11:00:00"
    alaska_airlines.save
    fedex.created_at = "2020-02-27 1:00:00"                        
    fedex.save
    visit "/airlines"
    expect(page.body).to match(/Alaska Airlines.*Fedex/m)
    # 
  end
end

RSpec.describe 'Airline Update From Airline Index Page' do
  describe 'airline story 17' do
    it 'can update airline from index page' do
      alaska_airlines = Airline.create!(name: 'Alaska Airlines',
                                    fleet_size: 83,
                                    is_mainline_passenger: true
                                    )
      visit '/airlines'

      click_link 'Update Airline'

      expect(current_path).to eq("/airlines/#{alaska_airlines.id}/edit")

      
    end
  end
end


