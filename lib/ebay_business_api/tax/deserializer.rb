# frozen_string_literal: true

require_relative '../tax_jurisdiction/deserializer'

module EbayBusinessApi
  class Tax
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :tax_jurisdiction, deserializer: TaxJurisdiction::Deserializer, hash_attribute: :taxJurisdiction
      attribute :tax_type, hash_attribute: :taxType
      attribute :shipping_and_handling_taxed, hash_attribute: :shippingAndHandlingTaxed
      attribute :included_in_price, hash_attribute: :includedInPrice
      attribute :ebay_collect_and_remit_tax, hash_attribute: :ebayCollectAndRemitTax
    end
  end
end
