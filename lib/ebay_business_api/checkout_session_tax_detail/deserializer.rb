# frozen_string_literal: true

require_relative '../price/deserializer'
require_relative '../tax_classification_detail/deserializer'

module EbayBusinessApi
  class CheckoutSessionTaxDetail
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :amount, deserializer: Price::Deserializer, hash_attribute: :amount
      attribute :tax_classification, hash_attribute: :taxClassification
      references_many :tax_classification_details, deserializer: TaxClassificationDetail::Deserializer, hash_attribute: :taxClassificationDetails
    end
  end
end
