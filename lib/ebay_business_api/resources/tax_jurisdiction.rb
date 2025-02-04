# frozen_string_literal: true

require_relative 'region'

module EbayBusinessApi
  class TaxJurisdiction < EbayBusinessApi::Resource
    references_one :region, to: Region
    attribute :tax_jurisdiction_id, type: LedgerSync::Type::String
  end
end
