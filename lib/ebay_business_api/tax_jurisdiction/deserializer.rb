# frozen_string_literal: true

require_relative '../region/deserializer'

module EbayBusinessApi
  class TaxJurisdiction
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :region, deserializer: Region::Deserializer, hash_attribute: :region
      attribute :tax_jurisdiction_id, hash_attribute: :taxJurisdictionId
    end
  end
end
