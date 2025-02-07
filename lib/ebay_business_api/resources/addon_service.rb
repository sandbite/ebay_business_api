# frozen_string_literal: true

require_relative 'price'

module EbayBusinessApi
  class AddonService < EbayBusinessApi::Resource
    attribute :selected, type: LedgerSync::Type::Boolean
    references_one :service_fee, to: Price
    attribute :service_id, type: LedgerSync::Type::String
    references_one :service_tax, to: Price
    attribute :service_type, type: LedgerSync::Type::String
  end
end
