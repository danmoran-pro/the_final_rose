require 'rails_helper'

RSpec.describe "When visititing a contestants show page" do
    before :each do
      @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
      @ben = Contestant.create!(name: "Ben Higgins", age: 23, hometown: "Denver, CO", bachelorette: @hannah)

      @outing_1 = Outing.create!(name: "Helicopter Ride", location: "Bali", date: Date.parse("2019-12-13"))
      @outing_2 = Outing.create!(name: "Kickball", location: "London", date: Date.parse("2019-11-12"))
      @outing_3 = Outing.create!(name: "Hotspring", location: "Japan", date: Date.parse("2019-10-11"))

      @heli_ride = ContestantOuting.create!(outing: @outing_1, contestant: @ben)
      @kickball = ContestantOuting.create!(outing: @outing_2, contestant: @ben)
      @hotspring = ContestantOuting.create!(outing: @outing_3, contestant: @ben)
    end
  it "I see single contestant's information" do

    visit "/contestants/#{@ben.id}"

    expect(page).to have_content(@ben.name)
    expect(page).to have_content(@ben.bachelorette.season_number)
    expect(page).to have_content(@ben.bachelorette.season_description)

    within "#outings" do
      expect(page).to have_content(@outing_1.name)
      expect(page).to have_content(@outing_2.name)
      expect(page).to have_content(@outing_3.name)

      click_link @outing_1.name
      expect(current_path).to eq("/outings/#{@outing_1.id}")
    end
  end
end
