# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class Fee < EbayBusinessApi::Resource
    references_one :amount, to: Price
    attribute :fee_type, type: LedgerSync::Type::String
  end
end
