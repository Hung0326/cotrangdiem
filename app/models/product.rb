# frozen_string_literal: true

class Product < ApplicationRecord
  before_save :convert_to_slug

  belongs_to :brand

  def convert_to_slug
    self.slug = Slug.to_slug("#{name} #{rand(10000)}")
  end
end
