module EbayBusinessApi
  class Region
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :region_name, hash_attribute: :regionName
      attribute :region_type, hash_attribute: :regionType
      attribute :region_id, hash_attribute: :regionId
    end
  end
end
