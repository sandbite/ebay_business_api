# frozen_string_literal: true

require_relative 'seller_legal_info'

module EbayBusinessApi
  class Seller < EbayBusinessApi::Resource
    attribute :username, type: LedgerSync::Type::String
    attribute :feedback_percentage, type: LedgerSync::Type::String
    attribute :feedback_score, type: LedgerSync::Type::Integer
    references_one :seller_legal_info, to: SellerLegalInfo
    attribute :seller_account_type, type: LedgerSync::Type::String
  end
end
