# frozen_string_literal: true

require_relative '../price/deserializer'

module EbayBusinessApi
  class AddonService
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :selected, hash_attribute: :selected
      references_one :service_fee, deserializer: Price::Deserializer, hash_attribute: :serviceFee
      attribute :service_id, hash_attribute: :serviceId
      references_one :service_tax, deserializer: Price::Deserializer, hash_attribute: :serviceTax
      attribute :service_type, hash_attribute: :serviceType
    end
  end
end
