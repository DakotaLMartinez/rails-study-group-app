class Post < ApplicationRecord
  validates :title, presence: true
  def to_param
    slug = title.split(/[\s.,\-\!\?]+/).join('-').downcase
    "#{slug}-#{id}"
  end

  def self.find_by_slug(slug)
    id = slug.split('-').last
    self.find_by_id(id)
  end
end
