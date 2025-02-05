# frozen_string_literal: true

require_relative '../addon_service/deserializer'
require_relative '../authenticity_verification/deserializer'
require_relative '../price/deserializer'
require_relative '../fee/deserializer'
require_relative '../image/deserializer'
require_relative '../promotion/deserializer'
require_relative '../seller/deserializer'
require_relative '../checkout_session_shipping_option/deserializer'
require_relative '../tax_detail/deserializer'

module EbayBusinessApi
  class LineItem
    class Deserializer < EbayBusinessApi::Deserializer
      references_many :addon_services, deserializer: AddonService::Deserializer, hash_attribute: :addonServices
      references_one :authenticity_verification, deserializer: AuthenticityVerification::Deserializer, hash_attribute: :authenticityVerification
      references_one :base_unit_price, deserializer: Price::Deserializer, hash_attribute: :baseUnitPrice
      references_many :fees, deserializer: Fee::Deserializer, hash_attribute: :fees
      references_one :image, deserializer: Image::Deserializer, hash_attribute: :image
      references_one :import_duties, deserializer: Price::Deserializer, hash_attribute: :importDuties
      attribute :item_id, hash_attribute: :itemId
      attribute :line_item_id, hash_attribute: :lineItemId
      references_one :net_price, deserializer: Price::Deserializer, hash_attribute: :netPrice
      references_many :promotions, deserializer: Promotion::Deserializer, hash_attribute: :promotions
      attribute :quantity, hash_attribute: :quantity
      references_one :seller, deserializer: Seller::Deserializer, hash_attribute: :seller
      references_many :shipping_options, deserializer: CheckoutSessionShippingOption::Deserializer, hash_attribute: :shippingOptions
      attribute :short_description, hash_attribute: :shortDescription
      references_many :tax_details, deserializer: TaxDetail::Deserializer, hash_attribute: :taxDetails
      attribute :title, hash_attribute: :title
    end
  end
end
