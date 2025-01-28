# frozen_string_literal: true

require 'ledger_sync'

module EbayBusinessApi
  def self.root(*paths)
    File.join(File.expand_path('../..', __dir__), *paths.map(&:to_s))
  end
end

require_relative 'ebay_business_api/config'
