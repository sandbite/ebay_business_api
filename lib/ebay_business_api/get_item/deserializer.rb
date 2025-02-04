# frozen_string_literal: true

require_relative '../price/deserializer'
require_relative '../item_location/deserializer'
require_relative '../image/deserializer'
require_relative '../marketing_price/deserializer'
require_relative '../seller/deserializer'
require_relative '../estimated_availability/deserializer'
require_relative '../shipping_option/deserializer'
require_relative '../ship_to_locations/deserializer'
require_relative '../return_terms/deserializer'
require_relative '../tax/deserializer'
require_relative '../localized_aspect/deserializer'
require_relative '../primary_product_review_rating/deserializer'
require_relative '../payment_method/deserializer'

module EbayBusinessApi
  class GetItem
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :item_id, hash_attribute: :itemId
      attribute :seller_item_revision, hash_attribute: :sellerItemRevision
      attribute :title, hash_attribute: :title
      attribute :short_description, hash_attribute: :shortDescription
      references_one :price, deserializer: Price::Deserializer, hash_attribute: :price
      attribute :category_path, hash_attribute: :categoryPath
      attribute :category_id_path, hash_attribute: :categoryIdPath
      attribute :condition, hash_attribute: :condition
      attribute :condition_id, hash_attribute: :conditionId
      references_one :item_location, deserializer: ItemLocation::Deserializer, hash_attribute: :itemLocation
      references_one :image, deserializer: Image::Deserializer, hash_attribute: :image
      references_many :additional_images, deserializer: Image::Deserializer, hash_attribute: :additionalImages
      references_one :marketing_price, deserializer: MarketingPrice::Deserializer, hash_attribute: :marketingPrice
      attribute :brand, hash_attribute: :brand
      attribute :item_creation_date, hash_attribute: :itemCreationDate
      references_one :seller, deserializer: Seller::Deserializer, hash_attribute: :seller
      attribute :gtin, hash_attribute: :gtin
      attribute :mpn, hash_attribute: :mpn
      references_many :estimated_availabilities, deserializer: EstimatedAvailability::Deserializer, hash_attribute: :estimatedAvailabilities
      references_many :shipping_options, deserializer: ShippingOption::Deserializer, hash_attribute: :shippingOptions
      references_one :ship_to_locations, deserializer: ShipToLocations::Deserializer, hash_attribute: :shipToLocations
      references_one :return_terms, deserializer: ReturnTerms::Deserializer, hash_attribute: :returnTerms
      references_many :taxes, deserializer: Tax::Deserializer, hash_attribute: :taxes
      references_many :localized_aspects, deserializer: LocalizedAspect::Deserializer, hash_attribute: :localizedAspects
      references_one :primary_product_review_rating, deserializer: PrimaryProductReviewRating::Deserializer, hash_attribute: :primaryProductReviewRating
      attribute :top_rated_buying_experience, hash_attribute: :topRatedBuyingExperience
      attribute :buying_options, hash_attribute: :buyingOptions
      attribute :item_affiliate_web_url, hash_attribute: :itemAffiliateWebUrl
      attribute :item_web_url, hash_attribute: :itemWebUrl
      attribute :description, hash_attribute: :description
      references_many :payment_methods, deserializer: PaymentMethod::Deserializer, hash_attribute: :paymentMethods
      attribute :immediate_pay, hash_attribute: :immediatePay
      attribute :unit_pricing_measure, hash_attribute: :unitPricingMeasure
      references_one :unit_price, deserializer: Price::Deserializer, hash_attribute: :unitPrice
      attribute :enabled_for_guest_checkout, hash_attribute: :enabledForGuestCheckout
      attribute :eligible_for_inline_checkout, hash_attribute: :eligibleForInlineCheckout
      attribute :lot_size, hash_attribute: :lotSize
      attribute :legacy_item_id, hash_attribute: :legacyItemId
      attribute :priority_listing, hash_attribute: :priorityListing
      attribute :adult_only, hash_attribute: :adultOnly
      attribute :category_id, hash_attribute: :categoryId
      attribute :listing_marketplace_id, hash_attribute: :listingMarketplaceId
   end
  end
end
