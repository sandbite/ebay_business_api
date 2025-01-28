# frozen_string_literal: true

require_relative 'client'

args = {
  base_module: EbayBusinessApi,
  root_path: 'ebay_business_api'
}

LedgerSync.register_ledger(:ebay_business_api, args) do |config|
  config.name = 'EbayBusinessApi'
end
