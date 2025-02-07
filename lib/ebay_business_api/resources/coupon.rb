# frozen_string_literal: true

module EbayBusinessApi
  class Coupon < EbayBusinessApi::Resource
    attribute :redemption_code, type: LedgerSync::Type::String
  end
end
