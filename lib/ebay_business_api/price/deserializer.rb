module EbayBusinessApi
  class Price
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :value, hash_attribute: :value
      attribute :currency, hash_attribute: :currency
    end
  end
end
