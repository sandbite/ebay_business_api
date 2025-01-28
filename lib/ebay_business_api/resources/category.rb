# frozen_string_literal: true

module EbayBusinessApi
  class Category < EbayBusinessApi::Resource
    attribute :category_id, type: LedgerSync::Type::String
    attribute :category_name, type: LedgerSync::Type::String
  end
end
