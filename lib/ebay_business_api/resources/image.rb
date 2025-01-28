# frozen_string_literal: true

module EbayBusinessApi
  class Image < EbayBusinessApi::Resource
    attribute :image_url, type: LedgerSync::Type::String
  end
end
