# frozen_string_literal: true

module EbayBusinessApi
  class VatDetail < EbayBusinessApi::Resource
    attribute :vat_id, type: LedgerSync::Type::String
    attribute :issuing_country, type: LedgerSync::Type::String
  end
end
