# frozen_string_literal: true

require_relative '../category/deserializer'
require_relative '../image/deserializer'
require_relative '../price/deserializer'
require_relative '../seller/deserializer'
require_relative '../marketing_price/deserializer'
require_relative '../pickup_option/deserializer'
require_relative '../shipping_option/deserializer'
require_relative '../item_location/deserializer'

module EbayBusinessApi
  class ItemSummary
    class Deserializer < EbayBusinessApi::Deserializer
      attribute :item_id, hash_attribute: :itemId
      attribute :title, hash_attribute: :title
      attribute :leaf_category_ids, hash_attribute: :leafCategoryIds
      references_many :categories, deserializer: Category::Deserializer, hash_attribute: :categories
      references_one :image, deserializer: Image::Deserializer, hash_attribute: :image
      references_one :price, deserializer: Price::Deserializer, hash_attribute: :price
      attribute :item_href, hash_attribute: :itemHref
      references_one :seller, deserializer: Seller::Deserializer, hash_attribute: :seller
      references_one :marketing_price, deserializer: MarketingPrice::Deserializer, hash_attribute: :marketingPrice
      attribute :condition, hash_attribute: :condition
      attribute :condition_id, hash_attribute: :conditionId
      references_many :thumbnail_images, deserializer: Image::Deserializer, hash_attribute: :thumbnailImages
      references_many :pickup_options, deserializer: PickupOption::Deserializer, hash_attribute: :pickupOptions
      references_many :shipping_options, deserializer: ShippingOption::Deserializer, hash_attribute: :shippingOptions
      attribute :buying_options, hash_attribute: :buyingOptions
      attribute :epid, hash_attribute: :epid
      attribute :item_affiliate_web_url, hash_attribute: :itemAffiliateWebUrl
      attribute :item_web_url, hash_attribute: :itemWebUrl
      references_one :item_location, deserializer: ItemLocation::Deserializer, hash_attribute: :itemLocation
      references_many :additional_images, deserializer: Image::Deserializer, hash_attribute: :additionalImages
      attribute :adult_only, hash_attribute: :adultOnly
      attribute :legacy_item_id, hash_attribute: :legacyItemId
      attribute :available_coupons, hash_attribute: :availableCoupons
      attribute :item_creation_date, hash_attribute: :itemCreationDate
      attribute :top_rated_buying_experience, hash_attribute: :topRatedBuyingExperience
      attribute :priority_listing, hash_attribute: :priorityListing
      attribute :listing_marketplace_id, hash_attribute: :listingMarketplaceId
    end
  end
end
