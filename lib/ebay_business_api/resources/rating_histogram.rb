# frozen_string_literal: true

module EbayBusinessApi
  class RatingHistogram < EbayBusinessApi::Resource
    attribute :rating, type: LedgerSync::Type::String
    attribute :count, type: LedgerSync::Type::Integer
  end
end
