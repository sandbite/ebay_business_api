# frozen_string_literal: true

require_relative '../payment_method_brand/deserializer'

module EbayBusinessApi
  class PaymentMethod
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :payment_method_type, hash_attribute: :paymentMethodType
      references_many :payment_method_brands, deserializer: PaymentMethodBrand::Deserializer, hash_attribute: :paymentMethodBrands
    end
  end
end
