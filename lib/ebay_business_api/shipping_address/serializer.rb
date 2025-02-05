# frozen_string_literal: true

module EbayBusinessApi
  class ShippingAddress
    class Serializer < EbayBusinessApi::Serializer
      attribute :addressLine1, resource_attribute: :address_line1
      attribute :addressLine2, resource_attribute: :address_line2
      attribute :city, resource_attribute: :city
      attribute :country, resource_attribute: :country
      attribute :county, resource_attribute: :county
      attribute :phoneNumber, resource_attribute: :phone_number
      attribute :postalCode, resource_attribute: :postal_code
      attribute :recipient, resource_attribute: :recipient
      attribute :stateOrProvince, resource_attribute: :state_or_province
    end
  end
end
