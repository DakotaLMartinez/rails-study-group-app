require 'rails_helper'

describe "Teams Features", js: true do 
  before(:all) do 
    @seahawks = Team.create(name: "Seahawks", coach: "Pete Carroll", city: "Seattle", sport: "Football") 
    @giants = Team.create(name: "Giants", coach: "Pat Schumer", city: "New York", sport: "Football") 
  end
  describe "index" do 
    it "displays all the teams" do 
      
      visit '/teams'
      puts "Team count: #{Team.all.count}"
      expect(page).to have_content("New York Giants")
      expect(page).to have_content("Seattle Seahawks")
    end
  end

  describe "show" do 
    it "displays the team's coach" do 
      visit team_path(@seahawks)
      expect(page).to have_content(@seahawks.coach)
    end
  end

  describe "new" do 
    it "displays the form to create a new team" do 
      visit new_team_path
      fill_in("team_city", with: "New York")
      fill_in("team_name", with: "Jets")
      # fill_in("team_coach", with: "Joe Walsh")
      fill_in("team_sport", with: "Football")

      find('input[type="submit"]').click
  
      expect(page).to have_selector('.field_with_errors')
      fill_in("team_coach", with: "Joe Walsh")
      find('input[type="submit"]').click
      expect(page).to have_content("New York Jets")
      
    end
  end
  
end