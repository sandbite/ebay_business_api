# frozen_string_literal: true

require_relative '../operation'

module EbayBusinessApi
  class Operation
    class Find
      include EbayBusinessApi::Operation::Mixin

      def operate
        return failure(error) if response.failure?

        success(
          resource: deserializer.deserialize(
            hash: hash_to_deserialize,
            resource:
          ),
          response: response.body
        )
      end

      private

      def request_method
        :get
      end

      def response
        @response ||= client.api(request_method, url, opts)
      end

      def hash_to_deserialize
        response.body
      end

      def url
        raise NotImplementedError, self.class.name
      end

      def opts
        raise NotImplementedError, self.class.name
      end

      def error
        errors = response.body&.[]('errors')
        return StandardError.new('Amazon Business API request failed') if errors.nil?

        message = errors.map do |error|
          "#{error['code']}: #{error['message']}"
        end.join(' ')

        StandardError.new(message)
      end
    end
  end
end
