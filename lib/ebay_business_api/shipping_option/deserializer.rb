require_relative '../price/deserializer'

module EbayBusinessApi
  class ShippingOption
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :shipping_cost_type, hash_attribute: :shippingCostType
      references_one :shipping_cost, deserializer: Price::Deserializer, hash_attribute: :shippingCost
    end
  end
end
