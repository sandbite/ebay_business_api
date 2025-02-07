# frozen_string_literal: true

require_relative '../price/deserializer'
require_relative '../adjustment/deserializer'
require_relative '../import_tax/deserializer'

module EbayBusinessApi
  class PricingSummary
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :additional_savings, deserializer: Price::Deserializer, hash_attribute: :additionalSavings
      references_one :addon_services_fee, deserializer: Price::Deserializer, hash_attribute: :addonServicesFee
      references_one :adjustment, deserializer: Adjustment::Deserializer, hash_attribute: :adjustment
      references_one :delivery_cost, deserializer: Price::Deserializer, hash_attribute: :deliveryCost
      references_one :delivery_discount, deserializer: Price::Deserializer, hash_attribute: :deliveryDiscount
      references_one :fee, deserializer: Price::Deserializer, hash_attribute: :fee
      references_one :import_charges, deserializer: Price::Deserializer, hash_attribute: :importCharges
      references_one :import_duties, deserializer: Price::Deserializer, hash_attribute: :importDuties
      references_one :import_tax, deserializer: ImportTax::Deserializer, hash_attribute: :importTax
      references_one :price_discount, deserializer: Price::Deserializer, hash_attribute: :priceDiscount
      references_one :price_subtotal, deserializer: Price::Deserializer, hash_attribute: :priceSubtotal
      references_one :tax, deserializer: Price::Deserializer, hash_attribute: :tax
      references_one :total, deserializer: Price::Deserializer, hash_attribute: :total
    end
  end
end
