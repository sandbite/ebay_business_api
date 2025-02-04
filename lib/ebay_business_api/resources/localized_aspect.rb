# frozen_string_literal: true

module EbayBusinessApi
  class LocalizedAspect < EbayBusinessApi::Resource
    attribute :type, type: LedgerSync::Type::String
    attribute :name, type: LedgerSync::Type::String
    attribute :value, type: LedgerSync::Type::String
  end
end
