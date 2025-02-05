# frozen_string_literal: true

module EbayBusinessApi
  class LineItemInput
    class Serializer < EbayBusinessApi::Serializer
      attribute :itemId, resource_attribute: :item_id
      attribute :quantity, resource_attribute: :quantity
    end
  end
end
