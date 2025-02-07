# frozen_string_literal: true

require_relative 'credit_card'
require_relative 'line_item_input'
require_relative 'shipping_address'

require_relative 'payment_method'
require_relative 'coupon'
require_relative 'line_item'
require_relative 'pricing_summary'
require_relative 'provided_payment_instrument'
require_relative 'shipping_address'

module EbayBusinessApi
  class CheckoutSession < EbayBusinessApi::Resource
    # Serializer
    references_one :credit_card, to: CreditCard
    references_many :line_item_inputs, to: LineItemInput

    # Deserializer
    references_many :accepted_payment_methods, to: PaymentMethod
    references_many :applied_coupons, to: Coupon
    attribute :checkout_session_id, type: LedgerSync::Type::String
    attribute :expiration_date, type: LedgerSync::Type::String
    references_many :line_items, to: LineItem
    references_one :pricing_summary, to: PricingSummary
    references_one :provided_payment_instrument, to: ProvidedPaymentInstrument

    # Common
    references_one :shipping_address, to: ShippingAddress
  end
end
