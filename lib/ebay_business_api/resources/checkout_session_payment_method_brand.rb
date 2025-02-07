# frozen_string_literal: true

require_relative 'image'

module EbayBusinessApi
  class CheckoutSessionPaymentMethodBrand < EbayBusinessApi::Resource
    references_one :logo_image, to: Image
    attribute :payment_method_brand_type, type: LedgerSync::Type::String
  end
end
