# frozen_string_literal: true

require_relative 'payment_instrument_reference'
require_relative 'checkout_session_payment_method_brand'

module EbayBusinessApi
  class ProvidedPaymentInstrument < EbayBusinessApi::Resource
    references_one :payment_instrument_reference, to: PaymentInstrumentReference
    references_one :payment_method_brand, to: CheckoutSessionPaymentMethodBrand
    attribute :payment_method_type, type: LedgerSync::Type::String
  end
end
