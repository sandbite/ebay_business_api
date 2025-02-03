# frozen_string_literal: true

require_relative '../vat_detail/deserializer'

module EbayBusinessApi
  class SellerLegalInfo
    class Deserializer < EbayBusinessApi::Deserializer
      references_many :vat_details, deserializer: VatDetail::Deserializer, hash_attribute: :vatDetails
    end
  end
end
