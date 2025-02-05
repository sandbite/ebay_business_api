# frozen_string_literal: true

require_relative '../billing_address/serializer'

module EbayBusinessApi
  class CreditCard
    class Serializer < EbayBusinessApi::Serializer
      attribute :accountHolderName, resource_attribute: :account_holder_name
      references_one :billingAddress, resource_attribute: :billing_address, serializer: BillingAddress::Serializer
      attribute :brand, resource_attribute: :brand
      attribute :cardNumber, resource_attribute: :card_number
      attribute :cvvNumber, resource_attribute: :cvv_number
      attribute :expireMonth, resource_attribute: :expire_month
      attribute :expireYear, resource_attribute: :expire_year
    end
  end
end
