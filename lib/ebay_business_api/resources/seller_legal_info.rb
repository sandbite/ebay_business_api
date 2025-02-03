# frozen_string_literal: true

require_relative 'vat_detail'

module EbayBusinessApi
  class SellerLegalInfo < EbayBusinessApi::Resource
    references_many :vat_details, to: VatDetail
  end
end
