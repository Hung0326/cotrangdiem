class Category < ApplicationRecord
  before_save :convert_to_slug
  scope :all_category, -> { where("level = 1 AND position < 7 AND status = 1").order(position: :asc) }
  def convert_to_slug
    self.slug = Slug.to_slug("#{name} #{rand(10000)}")
  end
end
