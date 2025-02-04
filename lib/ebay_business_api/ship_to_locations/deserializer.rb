require_relative '../region/deserializer'

module EbayBusinessApi
  class ShipToLocations
    class Deserializer < EbayBusinessApi::Deserializer
      references_many :region_included, deserializer: Region::Deserializer, hash_attribute: :regionIncluded
      references_many :region_excluded, deserializer: Region::Deserializer, hash_attribute: :regionExcluded
    end
  end
end
