# frozen_string_literal: true

module EbayBusinessApi
  class Region < EbayBusinessApi::Resource
    attribute :region_name, type: LedgerSync::Type::String
    attribute :region_type, type: LedgerSync::Type::String
    attribute :region_id, type: LedgerSync::Type::String
  end
end
