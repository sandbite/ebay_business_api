# frozen_string_literal: true

module EbayBusinessApi
  class Coupon
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :redemption_code, hash_attribute: :redemptionCode
    end
  end
end
