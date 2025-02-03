# frozen_string_literal: true

module EbayBusinessApi
  class Image < EbayBusinessApi::Resource
    attribute :image_url, type: LedgerSync::Type::String
    attribute :width, type: LedgerSync::Type::Integer
    attribute :height, type: LedgerSync::Type::Integer
  end
end
