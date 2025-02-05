# frozen_string_literal: true

module EbayBusinessApi
  class PaymentInstrumentReference < EbayBusinessApi::Resource
    attribute :external_reference_id, type: LedgerSync::Type::String
    attribute :last_four_digit_for_credit_card, type: LedgerSync::Type::String
  end
end
