# frozen_string_literal: true

module EbayBusinessApi
  class Browse
    module Operations
      class Search < EbayBusinessApi::Operation::Search
        class Contract < LedgerSync::Ledgers::Contract
          params do
            required(:q).filled(:string)
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
          "/buy/browse/v1/item_summary/search?q=#{resource.q}"
        end

        def opts
          {}
        end

      end
    end
  end
end
