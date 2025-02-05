# frozen_string_literal: true

module EbayBusinessApi
  class AuthenticityVerification < EbayBusinessApi::Resource
    attribute :description, type: LedgerSync::Type::String
    attribute :outcome_reason, type: LedgerSync::Type::String
    attribute :status, type: LedgerSync::Type::String
    attribute :terms_web_url, type: LedgerSync::Type::String
  end
end
