# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class Base
  attr_accessor :page

  def initialize(page)
    @page = page
  end

  def init_noko_data
    Nokogiri::HTML(URI.open(URI.escape(page)))
  end
end
