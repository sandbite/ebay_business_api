# frozen_string_literal: true

module EbayBusinessApi
  class AuthenticityVerification
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :description, hash_attribute: :description
      attribute :outcome_reason, hash_attribute: :outcomeReason
      attribute :status, hash_attribute: :status
      attribute :terms_web_url, hash_attribute: :termsWebUrl
    end
  end
end
