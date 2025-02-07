# frozen_string_literal: true

require_relative '../payment_method/deserializer'
require_relative '../coupon/deserializer'
require_relative '../line_item/deserializer'
require_relative '../pricing_summary/deserializer'
require_relative '../provided_payment_instrument/deserializer'
require_relative '../shipping_address/deserializer'

module EbayBusinessApi
  class CheckoutSession
    class Deserializer < EbayBusinessApi::Deserializer
      references_many :accepted_payment_methods, deserializer: PaymentMethod::Deserializer, hash_attribute: :acceptedPaymentMethods
      references_many :applied_coupons, deserializer: Coupon::Deserializer, hash_attribute: :appliedCoupons
      attribute :checkout_session_id, hash_attribute: :checkoutSessionId
      attribute :expiration_date, hash_attribute: :expirationDate
      references_many :line_items, deserializer: LineItem::Deserializer, hash_attribute: :lineItems
      references_one :pricing_summary, deserializer: PricingSummary::Deserializer, hash_attribute: :pricingSummary
      references_one :provided_payment_instrument, deserializer: ProvidedPaymentInstrument::Deserializer, hash_attribute: :providedPaymentInstrument
      references_one :shipping_address, deserializer: ShippingAddress::Deserializer, hash_attribute: :shippingAddress
    end
  end
end
