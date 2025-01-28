module EbayBusinessApi
  class PickupOption
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :pickup_location_type, hash_attribute: :pickupLocationType
    end
  end
end
