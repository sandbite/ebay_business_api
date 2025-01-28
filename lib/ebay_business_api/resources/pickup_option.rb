# frozen_string_literal: true

module EbayBusinessApi
  class PickupOption < EbayBusinessApi::Resource
    attribute :pickup_location_type, type: LedgerSync::Type::String
  end
end
