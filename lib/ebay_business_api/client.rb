# frozen_string_literal: true

require 'typhoeus'
require 'ledger_sync'
require 'base64'
require 'json'

module EbayBusinessApi
  class Client
    attr_reader :client_id, :client_secret, :sandbox

    def initialize(client_id:, client_secret:, sandbox: false)
      @client_id = client_id
      @client_secret = client_secret
      @sandbox = sandbox
    end

    def access_token
      response = Typhoeus.post(
        oauth_endpoint_url,
        { method: :post, headers: headers, body: body }
      )

      data = parse_response(response)

      raise_error(response, data) unless data[:access_token]

      data
    end

    private

    def oauth_endpoint_url
      return ENV['EBAY_PROD_ENDPOINT'] unless sandbox

      ENV['EBAY_SANDBOX_ENDPOINT']
    end

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
        'scope' => 'https://api.ebay.com/oauth/api_scope'
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
