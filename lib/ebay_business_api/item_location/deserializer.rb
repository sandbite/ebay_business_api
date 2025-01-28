module EbayBusinessApi
  class ItemLocation
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :postal_code, hash_attribute: :postalCode
      attribute :country, hash_attribute: :country
    end
  end
end
