# frozen_string_literal: true

require_relative 'price'
require_relative 'tax_classification_detail'

module EbayBusinessApi
  class CheckoutSessionTaxDetail < EbayBusinessApi::Resource
    references_one :amount, to: Price
    attribute :tax_classification, type: LedgerSync::Type::String
    references_many :tax_classification_details, to: TaxClassificationDetail
  end
end
