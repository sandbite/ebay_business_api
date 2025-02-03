# frozen_string_literal: true

module EbayBusinessApi
  class VatDetail
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :vat_id, hash_attribute: :vatId
      attribute :issuing_country, hash_attribute: :issuingCountry
    end
  end
end
