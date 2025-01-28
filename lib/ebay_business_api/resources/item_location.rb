# frozen_string_literal: true

module EbayBusinessApi
  class ItemLocation < EbayBusinessApi::Resource
    attribute :postal_code, type: LedgerSync::Type::String
    attribute :country, type: LedgerSync::Type::String
  end
end
