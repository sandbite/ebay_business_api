# frozen_string_literal: true

require_relative '../payment_instrument_reference/deserializer'
require_relative '../checkout_session_payment_method_brand/deserializer'

module EbayBusinessApi
  class ProvidedPaymentInstrument
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :payment_instrument_reference, deserializer: PaymentInstrumentReference::Deserializer, hash_attribute: :paymentInstrumentReference
      references_one :payment_method_brand, deserializer: CheckoutSessionPaymentMethodBrand::Deserializer, hash_attribute: :paymentMethodBrand
      attribute :payment_method_type, hash_attribute: :paymentMethodType
    end
  end
end
