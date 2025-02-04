# frozen_string_literal: true

require_relative 'return_period'

module EbayBusinessApi
  class ReturnTerms < EbayBusinessApi::Resource
    attribute :returns_accepted, type: LedgerSync::Type::Boolean
    attribute :refund_method, type: LedgerSync::Type::String
    attribute :return_method, type: LedgerSync::Type::String
    attribute :return_shipping_cost_payer, type: LedgerSync::Type::String
    references_one :return_period, to: ReturnPeriod
  end
end
