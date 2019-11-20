class Team < ApplicationRecord
  validates :city, :name, :coach, :sport, presence: true
end
