# frozen_string_literal: true

module EbayBusinessApi
  class CheckoutSession
    module Operations
      class Create < EbayBusinessApi::Operation::Create
        private

        def url
          "/buy/order/v1/checkout_session/initiate"
        end

        def opts
          {
            body: serializer.serialize(resource:)
          }
        end
      end
    end
  end
end
