module EbayBusinessApi
  class EstimatedAvailability
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :delivery_options, hash_attribute: :deliveryOptions
      attribute :availability_threshold_type, hash_attribute: :availabilityThresholdType
      attribute :availability_threshold, hash_attribute: :availabilityThreshold
      attribute :estimated_availability_status, hash_attribute: :estimatedAvailabilityStatus
      attribute :estimated_sold_quantity, hash_attribute: :estimatedSoldQuantity
      attribute :estimated_remaining_quantity, hash_attribute: :estimatedRemainingQuantity
    end
  end
end
