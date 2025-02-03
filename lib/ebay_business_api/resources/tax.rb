# frozen_string_literal: true

require_relative 'tax_jurisdiction'

module EbayBusinessApi
  class Tax < EbayBusinessApi::Resource
    references_one :tax_jurisdiction, to: TaxJurisdiction
    attribute :tax_type, type: LedgerSync::Type::String
    attribute :shipping_and_handling_taxed, type: LedgerSync::Type::Boolean
    attribute :included_in_price, type: LedgerSync::Type::Boolean
    attribute :ebay_collect_and_remit_tax, type: LedgerSync::Type::Boolean
  end
end
