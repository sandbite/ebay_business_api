# frozen_string_literal: true

require_relative '../price/deserializer'

module EbayBusinessApi
  class Promotion
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :discount, deserializer: Price::Deserializer, hash_attribute: :amount
      attribute :discount_percentage, hash_attribute: :discountPercentage
      attribute :message, hash_attribute: :message
      attribute :promotion_code, hash_attribute: :promotionCode
      attribute :promotion_type, hash_attribute: :promotionType
    end
  end
end
