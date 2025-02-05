# frozen_string_literal: true

module EbayBusinessApi
  class ShippingAddress < EbayBusinessApi::Resource
    attribute :address_line1, type: LedgerSync::Type::String
    attribute :address_line2, type: LedgerSync::Type::String
    attribute :city, type: LedgerSync::Type::String
    attribute :country, type: LedgerSync::Type::String
    attribute :county, type: LedgerSync::Type::String
    attribute :phone_number, type: LedgerSync::Type::String
    attribute :postal_code, type: LedgerSync::Type::String
    attribute :recipient, type: LedgerSync::Type::String
    attribute :state_or_province, type: LedgerSync::Type::String
  end
end
