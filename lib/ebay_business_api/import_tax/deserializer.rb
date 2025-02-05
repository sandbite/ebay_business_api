# frozen_string_literal: true

require_relative '../price/deserializer'

module EbayBusinessApi
  class ImportTax
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :amount, deserializer: Price::Deserializer, hash_attribute: :amount
      attribute :import_tax_type, hash_attribute: :importTaxType
    end
  end
end
