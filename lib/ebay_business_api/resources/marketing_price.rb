# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class MarketingPrice < EbayBusinessApi::Resource
    references_one :original_price, to: Price
    references_one :discount_amount, to: Price
    attribute :discount_percentage, type: LedgerSync::Type::String
    attribute :price_treatment, type: LedgerSync::Type::String
  end
end
