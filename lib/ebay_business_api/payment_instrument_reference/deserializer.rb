# frozen_string_literal: true

module EbayBusinessApi
  class PaymentInstrumentReference
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :external_reference_id, hash_attribute: :externalReferenceId
      attribute :last_four_digit_for_credit_card, hash_attribute: :lastFourDigitForCreditCard
    end
  end
end
