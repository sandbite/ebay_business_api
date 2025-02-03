# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class ShippingOption < EbayBusinessApi::Resource
    attribute :shipping_cost_type, type: LedgerSync::Type::String
    references_one :shipping_cost, to: Price
    attribute :shipping_service_code, type: LedgerSync::Type::String
    attribute :type, type: LedgerSync::Type::String
    attribute :quantity_used_for_estimate, type: LedgerSync::Type::Integer
    attribute :min_estimated_delivery_date, type: LedgerSync::Type::String
    attribute :max_estimated_delivery_date, type: LedgerSync::Type::String
    attribute :cut_off_date_used_for_estimate, type: LedgerSync::Type::String
  end
end
