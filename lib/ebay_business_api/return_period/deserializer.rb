module EbayBusinessApi
  class ReturnPeriod
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :value, hash_attribute: :value
      attribute :unit, hash_attribute: :unit
    end
  end
end
