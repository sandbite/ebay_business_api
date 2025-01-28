# frozen_string_literal: true

require_relative '../item_summary/deserializer'

module EbayBusinessApi
  class Browse
    class Deserializer < EbayBusinessApi::Deserializer
      references_many :item_summaries, deserializer: ItemSummary::Deserializer, hash_attribute: :itemSummaries
    end
  end
end
