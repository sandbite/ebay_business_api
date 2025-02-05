# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class Adjustment < EbayBusinessApi::Resource
    references_one :amount, to: Price
    attribute :label, type: LedgerSync::Type::String
  end
end
