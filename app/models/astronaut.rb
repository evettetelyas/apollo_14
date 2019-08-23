class Astronaut < ApplicationRecord
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  validates_presence_of :name, :age, :job

  def self.average_age
    Astronaut.average(:age)
  end

  def sort_missions
    self.missions.order(:title)
  end

  def total_time_in_space
    self.missions.sum(:time_in_space)
  end


end
