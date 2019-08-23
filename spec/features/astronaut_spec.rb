require 'rails_helper'

describe "astronaut index page" do
  before :each do
    @neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    @other_astronaut = Astronaut.create(name: "Not Neil Armstrong", age: 45, job: "Commander 2")
  end

  it "should show all astronauts" do
    visit "/astronauts"

    expect(page).to have_content(@neil.name)
    expect(page).to have_content(@neil.age)
    expect(page).to have_content(@neil.job)
  end

  it "should show average age" do
    visit "/astronauts"

    expect(page).to have_content("41")
  end

  it "should show all missions" do
    apollo_13 = @neil.missions.create(title: "Apollo 13", time_in_space: 120)
    cap_4 = @neil.missions.create(title: "Capricorn 4", time_in_space: 220)

    visit "/astronauts"

    expect(page).to have_content(apollo_13.title)
    expect(page).to have_content(cap_4.title)
  end

  it "should show total time in space" do
    apollo_13 = @neil.missions.create(title: "Apollo 13", time_in_space: 120)
    cap_4 = @neil.missions.create(title: "Capricorn 4", time_in_space: 220)

    visit "/astronauts"

    expect(page).to have_content("340 Days")
  end
end
