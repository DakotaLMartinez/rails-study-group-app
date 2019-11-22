class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.find_by_slug(slug)
    id = slug.split('-').last
    self.find_by_id(id)
  end
end
