# frozen_string_literal: true

module EbayBusinessApi
  class RatingHistogram
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :rating, hash_attribute: :rating
      attribute :count, hash_attribute: :count
    end
  end
end
