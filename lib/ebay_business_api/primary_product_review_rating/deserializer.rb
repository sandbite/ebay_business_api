# frozen_string_literal: true

require_relative '../rating_histogram/deserializer'

module EbayBusinessApi
  class PrimaryProductReviewRating
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :review_count, hash_attribute: :reviewCount
      attribute :average_rating, hash_attribute: :averageRating
      references_many :rating_histograms, deserializer: RatingHistogram::Deserializer, hash_attribute: :ratingHistograms
    end
  end
end
