# frozen_string_literal: true

require_relative 'payment_method_brand'

module EbayBusinessApi
  class PaymentMethod < EbayBusinessApi::Resource
    attribute :label, type: LedgerSync::Type::String
    attribute :payment_method_type, type: LedgerSync::Type::String
    references_many :payment_method_brands, to: PaymentMethodBrand
  end
end
