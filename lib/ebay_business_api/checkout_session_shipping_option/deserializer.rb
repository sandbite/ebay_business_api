# frozen_string_literal: true

require_relative '../price/deserializer'

module EbayBusinessApi
  class CheckoutSessionShippingOption
    class Deserializer < EbayBusinessApi::Deserializer
    references_one :base_delivery_cost, deserializer: Price::Deserializer, hash_attribute: :baseDeliveryCost
    references_one :delivery_discount, deserializer: Price::Deserializer, hash_attribute: :deliveryDiscount
    attribute :ebay_shipping, hash_attribute: :ebayShipping
    references_one :import_charges, deserializer: Price::Deserializer, hash_attribute: :importCharges
    attribute :max_estimated_delivery_date, hash_attribute: :maxEstimatedDeliveryDate
    attribute :min_estimated_delivery_date, hash_attribute: :minEstimatedDeliveryDate
    attribute :selected, hash_attribute: :selected
    attribute :shipping_carrier_code, hash_attribute: :shippingCarrierCode
    attribute :shipping_option_id, hash_attribute: :shippingOptionId
    attribute :shipping_service_code, hash_attribute: :shippingServiceCode
    end
  end
end
