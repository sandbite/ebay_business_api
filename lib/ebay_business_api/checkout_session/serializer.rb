# frozen_string_literal: true

require_relative '../credit_card/serializer'
require_relative '../line_item_input/serializer'
require_relative '../shipping_address/serializer'

module EbayBusinessApi
  class CheckoutSession
    class Serializer < EbayBusinessApi::Serializer
      references_one :creditCard, resource_attribute: :credit_card, serializer: CreditCard::Serializer
      references_many :lineItemInputs, resource_attribute: :line_item_inputs, serializer: LineItemInput::Serializer
      references_one :shippingAddress, resource_attribute: :shipping_address, serializer: ShippingAddress::Serializer
    end
  end
end



