# frozen_string_literal: true

require_relative 'price'
require_relative 'adjustment'
require_relative 'import_tax'

module EbayBusinessApi
  class PricingSummary < EbayBusinessApi::Resource
    references_one :additional_savings, to: Price
    references_one :addon_services_fee, to: Price
    references_one :adjustment, to: Adjustment
    references_one :delivery_cost, to: Price
    references_one :delivery_discount, to: Price
    references_one :fee, to: Price
    references_one :import_charges, to: Price
    references_one :import_duties, to: Price
    references_one :import_tax, to: ImportTax
    references_one :price_discount, to: Price
    references_one :price_subtotal, to: Price
    references_one :tax, to: Price
    references_one :total, to: Price
  end
end
