# frozen_string_literal: true

module EbayBusinessApi
  class ReturnPeriod < EbayBusinessApi::Resource
    attribute :value, type: LedgerSync::Type::Integer
    attribute :unit, type: LedgerSync::Type::String
  end
end
