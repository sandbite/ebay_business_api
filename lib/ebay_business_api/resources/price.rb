# frozen_string_literal: true

module EbayBusinessApi
  class Price < EbayBusinessApi::Resource
    attribute :value, type: LedgerSync::Type::String
    attribute :currency, type: LedgerSync::Type::String
  end
end
