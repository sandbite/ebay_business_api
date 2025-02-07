# frozen_string_literal: true

require_relative '../price/deserializer'

module EbayBusinessApi
  class TaxClassificationDetail
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :amount, deserializer: Price::Deserializer, hash_attribute: :amount
      attribute :tax_type, hash_attribute: :taxType
    end
  end
end
