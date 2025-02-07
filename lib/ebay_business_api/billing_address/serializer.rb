# frozen_string_literal: true

module EbayBusinessApi
  class BillingAddress
    class Serializer < EbayBusinessApi::Serializer
      attribute :addressLine1, resource_attribute: :address_line1
      attribute :addressLine2, resource_attribute: :address_line2
      attribute :city, resource_attribute: :city
      attribute :country, resource_attribute: :country
      attribute :county, resource_attribute: :county
      attribute :firstName, resource_attribute: :first_name
      attribute :lastName, resource_attribute: :last_name
      attribute :postalCode, resource_attribute: :postal_code
      attribute :stateOrProvince, resource_attribute: :state_or_province
    end
  end
end
