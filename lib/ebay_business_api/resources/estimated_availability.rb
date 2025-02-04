# frozen_string_literal: true

module EbayBusinessApi
  class EstimatedAvailability < EbayBusinessApi::Resource
    attribute :delivery_options, type: Type::Array
    attribute :availability_threshold_type, type: LedgerSync::Type::String
    attribute :availability_threshold, type: LedgerSync::Type::Integer
    attribute :estimated_availability_status, type: LedgerSync::Type::String
    attribute :estimated_sold_quantity, type: LedgerSync::Type::Integer
    attribute :estimated_remaining_quantity, type: LedgerSync::Type::Integer
  end
end
