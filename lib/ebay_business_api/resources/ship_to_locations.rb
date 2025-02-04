# frozen_string_literal: true

require_relative 'region'

module EbayBusinessApi
  class ShipToLocations < EbayBusinessApi::Resource
    references_many :region_included, to: Region
    references_many :region_excluded, to: Region
  end
end
