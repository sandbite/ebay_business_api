# frozen_string_literal: true

module EbayBusinessApi
  class Seller < EbayBusinessApi::Resource
    attribute :username, type: LedgerSync::Type::String
    attribute :feedback_percentage, type: LedgerSync::Type::String
    attribute :feedback_score, type: LedgerSync::Type::Integer
  end
end
