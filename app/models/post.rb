class Post < ApplicationRecord
  validates :title, presence: true
  def to_param
    slug = title.split(/[\s.,\-\!\?]+/).join('-').downcase
    "#{slug}-#{id}"
  end
end
