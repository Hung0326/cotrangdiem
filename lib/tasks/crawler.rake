# frozen_string_literal: true

require 'open-uri'

# rake task
namespace :crawler do
  task populate: :environment do
    CrawlerCategory.new.crawler
    CrawlerProduct.new.crawler
  end
end
