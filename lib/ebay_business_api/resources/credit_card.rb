# frozen_string_literal: true

require_relative 'billing_address'

module EbayBusinessApi
  class CreditCard < EbayBusinessApi::Resource
    attribute :account_holder_name, type: LedgerSync::Type::String
    references_one :billing_address, to: BillingAddress
    attribute :brand, type: LedgerSync::Type::String
    attribute :card_number, type: LedgerSync::Type::String
    attribute :cvv_number, type: LedgerSync::Type::String
    attribute :expire_month, type: LedgerSync::Type::Integer
    attribute :expire_year, type: LedgerSync::Type::Integer
  end
end
