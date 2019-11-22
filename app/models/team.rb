class Team < ApplicationRecord
  validates :city, :name, :coach, :sport, presence: true
  def to_param
    city_slug = city.split(/[\s.,\-\!\?]+/).join('-').downcase
    name_slug = name.split(/[\s.,\-\!\?]+/).join('-').downcase
    "#{city_slug}-#{name_slug}-#{id}"
  end
end
