# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class CheckoutSessionShippingOption < EbayBusinessApi::Resource
    references_one :base_delivery_cost, to: Price
    references_one :delivery_discount, to: Price
    attribute :ebay_shipping, type: LedgerSync::Type::Boolean
    references_one :import_charges, to: Price
    attribute :max_estimated_delivery_date, type: LedgerSync::Type::String
    attribute :min_estimated_delivery_date, type: LedgerSync::Type::String
    attribute :selected, type: LedgerSync::Type::Boolean
    attribute :shipping_carrier_code, type: LedgerSync::Type::String
    attribute :shipping_option_id, type: LedgerSync::Type::String
    attribute :shipping_service_code, type: LedgerSync::Type::String

  end
end
