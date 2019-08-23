require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'model tests' do
    before :each do
      @neil = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      @other_astronaut = Astronaut.create(name: "Not Neil Armstrong", age: 45, job: "Commander 2")
      @cap_4 = @neil.missions.create(title: "Capricorn 4", time_in_space: 220)
      @apollo_13 = @neil.missions.create(title: "Apollo 13", time_in_space: 120)
      @cap_12 = @other_astronaut.missions.create(title: "Capricorn 12", time_in_space: 123)
      @apollo_15 = @other_astronaut.missions.create(title: "Apollo 15", time_in_space: 560)
    end

    describe "average_age" do
      it { expect(Astronaut.all.average_age).to eq(41.0) }
    end

    describe "sort_missions_alphabtically" do

      it { expect(@neil.sort_missions.first).to eq(@apollo_13)}
      it { expect(@neil.sort_missions.last).to eq(@cap_4)}
    end

    describe "total_time_in_space" do

      it { expect(@neil.total_time_in_space).to eq(340) }
    end
  end

end
