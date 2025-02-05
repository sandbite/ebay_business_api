# frozen_string_literal: true

module EbayBusinessApi
  class LineItemInput < EbayBusinessApi::Resource
    attribute :item_id, type: LedgerSync::Type::String
    attribute :quantity, type: LedgerSync::Type::String
  end
end
