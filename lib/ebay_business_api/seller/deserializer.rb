module EbayBusinessApi
  class Seller
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :username, hash_attribute: :username
      attribute :feedback_percentage, hash_attribute: :feedbackPercentage
      attribute :feedback_score, hash_attribute: :feedbackScore
    end
  end
end
