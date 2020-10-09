# frozen_string_literal: true

# /lib/logger/logger.rb
require 'logger'
class Logger
  def self.logger
    @logger ||= Logger.new(Rails.root.join('log', 'crawler', 'crawler_categoty.log'))
  end
end
