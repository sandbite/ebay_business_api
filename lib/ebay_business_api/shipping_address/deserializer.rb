# frozen_string_literal: true

module EbayBusinessApi
  class ShippingAddress
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :address_line1, hash_attribute: :addressLine1
      attribute :address_line2, hash_attribute: :addressLine2
      attribute :city, hash_attribute: :city
      attribute :country, hash_attribute: :country
      attribute :county, hash_attribute: :county
      attribute :phone_number, hash_attribute: :phoneNumber
      attribute :postal_code, hash_attribute: :postalCode
      attribute :recipient, hash_attribute: :recipient
      attribute :state_or_province, hash_attribute: :stateOrProvince
    end
  end
end
