# frozen_string_literal: true

module EbayBusinessApi
  class GetItem
    module Operations
      class Find < EbayBusinessApi::Operation::Find
        class Contract < LedgerSync::Ledgers::Contract
          params do
            required(:item_id).filled(:string)
          end
        end

        private

        def request_method
          :get
        end

        def hash_to_deserialize
          response.body || []
        end

        def url
          "/buy/browse/v1/item/#{resource.item_id.gsub('|', '%7C')}"
        end

        def opts
          {
            headers: serializer.serialize(resource:).merge(
              'X-EBAY-C-MARKETPLACE-ID' => 'EBAY_US'
            )
          }
        end
      end
    end
  end
end
