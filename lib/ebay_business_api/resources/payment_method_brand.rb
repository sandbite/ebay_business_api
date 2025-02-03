# frozen_string_literal: true

module EbayBusinessApi
  class PaymentMethodBrand < EbayBusinessApi::Resource
    attribute :payment_method_brand_type, type: LedgerSync::Type::String
  end
end
