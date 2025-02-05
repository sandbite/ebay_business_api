# frozen_string_literal: true

require_relative 'addon_service'
require_relative 'authenticity_verification'
require_relative 'price'
require_relative 'fee'
require_relative 'image'
require_relative 'promotion'
require_relative 'seller'
require_relative 'checkout_session_shipping_option'
require_relative 'tax_detail'

module EbayBusinessApi
  class LineItem < EbayBusinessApi::Resource
    references_many :addon_services, to: AddonService
    references_one :authenticity_verification, to: AuthenticityVerification
    references_one :base_unit_price, to: Price
    references_many :fees, to: Fee
    references_one :image, to: Image
    references_one :import_duties, to: Price
    attribute :item_id, type: LedgerSync::Type::String
    attribute :line_item_id, type: LedgerSync::Type::String
    references_one :net_price, to: Price
    references_many :promotions, to: Promotion
    attribute :quantity, type: LedgerSync::Type::Integer
    references_one :seller, to: Seller
    references_many :shipping_options, to: CheckoutSessionShippingOption
    attribute :short_description, type: LedgerSync::Type::String
    references_many :tax_details, to: TaxDetail
    attribute :title, type: LedgerSync::Type::String
  end
end
