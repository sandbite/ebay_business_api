# frozen_string_literal: true

require_relative 'item_summary'

module EbayBusinessApi
  class Browse < EbayBusinessApi::Resource
    attribute :q, type: LedgerSync::Type::String
    references_many :item_summaries,to: ItemSummary
  end
end
