# frozen_string_literal: true

require_relative '../price/deserializer'

module EbayBusinessApi
  class Adjustment
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :amount, deserializer: Price::Deserializer, hash_attribute: :amount
      attribute :label, hash_attribute: :label
    end
  end
end
