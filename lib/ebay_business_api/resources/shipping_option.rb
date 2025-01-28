# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class ShippingOption < EbayBusinessApi::Resource
    attribute :shipping_cost_type, type: LedgerSync::Type::String
    references_one :shipping_cost, to: Price
  end
end
