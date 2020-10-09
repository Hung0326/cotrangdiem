# frozen_string_literal: true

class Brand < ApplicationRecord
  before_save :convert_to_slug
  
  has_many :products

  def convert_to_slug
    self.slug = Slug.to_slug("#{name} #{rand(10000)}")
  end
end
