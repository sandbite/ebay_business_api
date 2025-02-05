# frozen_string_literal: true

require_relative '../image/deserializer'

module EbayBusinessApi
  class CheckoutSessionPaymentMethodBrand
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :logo_image, deserializer: Image::Deserializer, hash_attribute: :logoImage
      attribute :payment_method_brand_type, hash_attribute: :paymentMethodBrandType
    end
  end
end
