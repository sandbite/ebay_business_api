# frozen_string_literal: true

require_relative 'rating_histogram'

module EbayBusinessApi
  class PrimaryProductReviewRating < EbayBusinessApi::Resource
    attribute :review_count, type: LedgerSync::Type::Integer
    attribute :average_rating, type: LedgerSync::Type::String
    references_many :rating_histograms, to: RatingHistogram
  end
end
