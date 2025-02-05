# frozen_string_literal: true

require_relative '../price/deserializer'

module EbayBusinessApi
  class Fee
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :amount, deserializer: Price::Deserializer, hash_attribute: :amount
      attribute :fee_type, hash_attribute: :feeType
    end
  end
end
