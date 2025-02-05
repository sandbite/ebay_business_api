# frozen_string_literal: true

require_relative '../tax_jurisdiction/deserializer'

module EbayBusinessApi
  class TaxDetail
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :includedInPrice, hash_attribute: :includedInPrice
      references_one :tax_jurisdiction, deserializer: TaxJurisdiction::Deserializer, hash_attribute: :taxJurisdiction
      attribute :tax_type, hash_attribute: :taxType
    end
  end
end
