require_relative '../price/deserializer'

module EbayBusinessApi
  class ShippingOption
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :shipping_cost_type, hash_attribute: :shippingCostType
      references_one :shipping_cost, deserializer: Price::Deserializer, hash_attribute: :shippingCost
      attribute :shipping_service_code, hash_attribute: :shippingServiceCode
      attribute :type, hash_attribute: :type
      attribute :quantity_used_for_estimate, hash_attribute: :quantityUsedForEstimate
      attribute :min_estimated_delivery_date, hash_attribute: :minEstimatedDeliveryDate
      attribute :max_estimated_delivery_date, hash_attribute: :maxEstimatedDeliveryDate
      attribute :cut_off_date_used_for_estimate, hash_attribute: :cutOffDateUsedForEstimate
    end
  end
end
