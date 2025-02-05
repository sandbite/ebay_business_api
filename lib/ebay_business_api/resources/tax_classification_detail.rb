# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class TaxClassificationDetail < EbayBusinessApi::Resource
    references_one :amount, to: Price
    attribute :tax_type, type: LedgerSync::Type::String
  end
end
