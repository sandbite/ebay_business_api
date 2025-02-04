# frozen_string_literal: true

require_relative '../types/array'
require_relative 'image'
require_relative 'price'
require_relative 'marketing_price'
require_relative 'seller'
require_relative 'item_location'
require_relative 'tax'
require_relative 'estimated_availability'
require_relative 'shipping_option'
require_relative 'ship_to_locations'
require_relative 'return_terms'
require_relative 'localized_aspect'
require_relative 'primary_product_review_rating'
require_relative 'payment_method'

module EbayBusinessApi
  class GetItem < EbayBusinessApi::Resource
    attribute :item_id, type: LedgerSync::Type::String
    attribute :seller_item_revision, type: LedgerSync::Type::String
    attribute :title, type: LedgerSync::Type::String
    attribute :short_description, type: LedgerSync::Type::String
    references_one :price, to: Price
    attribute :category_path, type: LedgerSync::Type::String
    attribute :category_id_path, type: LedgerSync::Type::String
    attribute :condition, type: LedgerSync::Type::String
    attribute :condition_id, type: LedgerSync::Type::String
    references_one :item_location, to: ItemLocation
    references_one :image, to: Image
    references_many :additional_images, to: Image
    references_one :marketing_price, to: MarketingPrice
    attribute :brand, type: LedgerSync::Type::String
    attribute :item_creation_date, type: LedgerSync::Type::String
    references_one :seller, to: Seller
    attribute :gtin, type: LedgerSync::Type::String
    attribute :mpn, type: LedgerSync::Type::String
    references_many :estimated_availabilities, to: EstimatedAvailability
    references_many :shipping_options, to: ShippingOption
    references_one :ship_to_locations, to: ShipToLocations
    references_one :return_terms, to: ReturnTerms
    references_many :taxes, to: Tax
    references_many :localized_aspects, to: LocalizedAspect
    references_one :primary_product_review_rating, to: PrimaryProductReviewRating
    attribute :top_rated_buying_experience, type: LedgerSync::Type::Boolean
    attribute :buying_options, type: Type::Array
    attribute :item_affiliate_web_url, type: LedgerSync::Type::String
    attribute :item_web_url, type: LedgerSync::Type::String
    attribute :description, type: LedgerSync::Type::String
    references_many :payment_methods, to: PaymentMethod
    attribute :immediate_pay, type: LedgerSync::Type::Boolean
    attribute :unit_pricing_measure, type: LedgerSync::Type::String
    references_one :unit_price, to: Price
    attribute :enabled_for_guest_checkout, type: LedgerSync::Type::Boolean
    attribute :eligible_for_inline_checkout, type: LedgerSync::Type::Boolean
    attribute :lot_size, type: LedgerSync::Type::Integer
    attribute :legacy_item_id, type: LedgerSync::Type::String
    attribute :priority_listing, type: LedgerSync::Type::Boolean
    attribute :adult_only, type: LedgerSync::Type::Boolean
    attribute :category_id, type: LedgerSync::Type::String
    attribute :listing_marketplace_id, type: LedgerSync::Type::String
  end
end
