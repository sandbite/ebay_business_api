# frozen_string_literal: true

require_relative 'category'
require_relative 'image'
require_relative 'price'
require_relative 'seller'
require_relative 'marketing_price'
require_relative 'item_location'
require_relative 'pickup_option'
require_relative 'shipping_option'
require_relative '../types/array'

module EbayBusinessApi
  class ItemSummary < EbayBusinessApi::Resource
    attribute :q, type: LedgerSync::Type::String
    attribute :item_id, type: LedgerSync::Type::String
    attribute :title, type: LedgerSync::Type::String
    attribute :leaf_category_ids, type: Type::Array
    references_many :categories, to: Category
    references_one :image, to: Image
    references_one :price, to: Price
    attribute :item_href, type: LedgerSync::Type::String
    references_one :seller, to: Seller
    references_one :marketing_price, to: MarketingPrice
    attribute :condition, type: LedgerSync::Type::String
    attribute :condition_id, type: LedgerSync::Type::String
    references_many :thumbnail_images,to: Image
    references_many :pickup_options,to: PickupOption
    references_many :shipping_options,to: ShippingOption
    attribute :buying_options, type: Type::Array
    attribute :epid, type: LedgerSync::Type::String
    attribute :item_affiliate_web_url, type: LedgerSync::Type::String
    attribute :item_web_url, type: LedgerSync::Type::String
    references_one :item_location,to: ItemLocation
    references_many :additional_images,to: Image
    attribute :adult_only, type: LedgerSync::Type::Boolean
    attribute :legacy_item_id, type: LedgerSync::Type::String
    attribute :available_coupons, type: LedgerSync::Type::Boolean
    attribute :item_creation_date, type: LedgerSync::Type::String
    attribute :top_rated_buying_experience, type: LedgerSync::Type::Boolean
    attribute :priority_listing, type: LedgerSync::Type::Boolean
    attribute :listing_marketplace_id, type: LedgerSync::Type::String
  end
end
