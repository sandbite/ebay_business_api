# frozen_string_literal: true

require_relative '../return_period/deserializer'

module EbayBusinessApi
  class ReturnTerms
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :returns_accepted, hash_attribute: :returnsAccepted
      attribute :refund_method, hash_attribute: :refundMethod
      attribute :return_method, hash_attribute: :returnMethod
      attribute :return_shipping_cost_payer, hash_attribute: :returnShippingCostPayer
      references_one :return_period, deserializer: ReturnPeriod::Deserializer, hash_attribute: :returnPeriod
    end
  end
end
