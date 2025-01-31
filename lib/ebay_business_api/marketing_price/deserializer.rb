require_relative '../price/deserializer'

module EbayBusinessApi
  class MarketingPrice
    class Deserializer < EbayBusinessApi::Deserializer
      references_one :original_price, deserializer: Price::Deserializer, hash_attribute: :originalPrice
      attribute :discount_percentage, hash_attribute: :discountPercentage
      references_one :discount_amount, deserializer: Price::Deserializer, hash_attribute: :discountAmount
      attribute :price_treatment, hash_attribute: :priceTreatment
    end
  end
end
