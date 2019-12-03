require 'rails_helper'

describe "Teams Features", js: true do 
  before(:each) do 
    @seahawks = Team.create(name: "Seahawks", coach: "Pete Carroll", city: "Seattle", sport: "Football") 
    @giants = Team.create(name: "Giants", coach: "Pat Schumer", city: "New York", sport: "Football") 
    @jets = Team.create(name: "Jets", coach: "Joe Walsh", city: "New York", sport: "Football")
  end
  describe "index" do 
    it "displays all the teams" do 
      visit teams_path
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
      expect(page.current_path).to eq(teams_path)
      expect(page).to have_selector("a[href='#{team_path(Team.last)}']")
      
    end
  end

  describe "edit" do 
    it "prefills with a team's previous data" do 
      visit edit_team_path(@jets)
      # expect that each of these inputs have values matching the @jets object
      expect(find('input#team_city').value).to eq(@jets.city)
      expect(find('input#team_name').value).to eq(@jets.name)
      expect(find('input#team_coach').value).to eq(@jets.coach)
      expect(find('input#team_sport').value).to eq(@jets.sport)
      # next we change the coach value to the correct coach for the Jets and submit the form
      fill_in('team_coach', with: "")
      find('input[type="submit"]').click
      expect(page).to have_selector('.field_with_errors')

      fill_in('team_coach', with: "Adam Gase")
      find('input[type="submit"]').click
      # expect the next page to show us the new coach's name.
      expect(page.current_path).to eq(team_path(@jets))
      expect(page).to have_content("Adam Gase")
    end
  end

  describe "delete" do 
    it "removes an existing team from the database" do 
      visit team_path(@jets)
      click_on "Delete Team"
      page.driver.browser.switch_to.alert.accept
      expect(page.current_path).to eq(teams_path)
      expect(page).not_to have_selector("a[href='#{team_path(@jets)}']")
    end
  end
  
end