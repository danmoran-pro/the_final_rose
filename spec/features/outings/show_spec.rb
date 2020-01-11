require 'rails_helper'

RSpec.describe "When visititing a outings show page" do
    before :each do
      @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
      @ben    = Contestant.create!(name: "Ben Higgins",  age: 23, hometown: "Denver, CO",   bachelorette: @hannah)
      @danny  = Contestant.create!(name: "Danny Moran",  age: 26, hometown: "Denver, CO",   bachelorette: @hannah)
      @daniel = Contestant.create!(name: "Daniel Maran", age: 30, hometown: "Lakewood, CO", bachelorette: @hannah)
      @alex   = Contestant.create!(name: "Alex Moron",   age: 26, hometown: "Aurora, CO",   bachelorette: @hannah)

      @outing_1 = Outing.create!(name: "Helicopter Ride", location: "Bali", date: Date.parse("2019-12-13"))

     ContestantOuting.create!(outing: @outing_1, contestant: @ben)
     ContestantOuting.create!(outing: @outing_1, contestant: @danny)
     ContestantOuting.create!(outing: @outing_1, contestant: @daniel)
     ContestantOuting.create!(outing: @outing_1, contestant: @alex)
    end

  it "I see an outings, atributes, name and count of contestants" do
    visit "/outings/#{@outing_1.id}"

    expect(page).to have_content(@outing_1.name)

    within "#outing" do
      expect(page).to have_content(@outing_1.location)
      expect(page).to have_content(@outing_1.date)
      expect(page).to have_content(@outing_1.contestants.count)
    end

    within "#contestants" do
      expect(page).to have_content(@danny.name)
      expect(page).to have_content(@daniel.name)
      expect(page).to have_content(@alex.name)
    end
  end
end
