# frozen_string_literal: true

require 'typhoeus'

module EbayBusinessApi
  class Client
    attr_reader :client_id, :client_secret

    include LedgerSync::Ledgers::Client::Mixin

    def initialize(client_id:, client_secret:)
      @client_id = client_id
      @client_secret = client_secret
    end

    def access_token
      response = Typhoeus.post(
        'https://api.ebay.com/identity/v1/oauth2/token',
        { method: :post, headers: headers, body: body }
      ).run

      data = parse_response(response)

      raise_error(response, data) unless data[:access_token]

      data
    end

    private

    def headers
      {
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Authorization' => "Basic #{encoded_credentials}"
      }
    end

    def encoded_credentials
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end

    def body
      {
        'grant_type' => 'client_credentials',
        'scope' => [
          'https://api.ebay.com/oauth/api_scope',
          'https://api.ebay.com/oauth/api_scope/buy.order.readonly',
          'https://api.ebay.com/oauth/api_scope/buy.guest.order'
        ].join(' ')
      }
    end

    def parse_response(response)
      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError
      raise StandardError, "Invalid JSON response: #{response.body}"
    end

    def raise_error(response, data)
      error_details = {
        code: response.code,
        response_headers: response.headers,
        response_body: data
      }
      raise StandardError, error_details.to_s
    end
  end
end
