# frozen_string_literal: true

require_relative 'tax_jurisdiction'

module EbayBusinessApi
  class TaxDetail < EbayBusinessApi::Resource
    attribute :includedInPrice, type: LedgerSync::Type::Boolean
    references_one :tax_jurisdiction, to: TaxJurisdiction
    attribute :taxType, type: LedgerSync::Type::String
  end
end
