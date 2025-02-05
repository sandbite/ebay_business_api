# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class Promotion < EbayBusinessApi::Resource
    references_one :discount, to: Price
    attribute :discount_percentage, type: LedgerSync::Type::String
    attribute :message, type: LedgerSync::Type::String
    attribute :promotion_code, type: LedgerSync::Type::String
    attribute :promotion_type, type: LedgerSync::Type::String
  end
end
