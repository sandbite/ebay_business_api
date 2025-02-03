# frozen_string_literal: true

module EbayBusinessApi
  class PaymentMethodBrand
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :payment_method_brand_type, hash_attribute: :paymentMethodBrandType
    end
  end
end
