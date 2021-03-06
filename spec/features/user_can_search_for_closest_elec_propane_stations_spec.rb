require 'rails_helper'

describe "when a user visits the home page" do
  it "can enter a zipcode to search for closest stations" do

    visit root_path
    fill_in "location", with: "80203"
    click_on "Locate"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("City of Denver - Cultural Center Complex Garage")
    expect(page).to have_content("65 W 12th Ave")
    expect(page).to have_content("Garage business hours; pay lot")
    expect(page).to have_content("Fuel type available: ELEC")
    expect(page).to have_content("Distance: 0.42178")
  end
end


# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
