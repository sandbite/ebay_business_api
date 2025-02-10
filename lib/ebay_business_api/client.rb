# frozen_string_literal: true

require 'typhoeus'
require 'base64'
require 'json'
require 'uri'

module EbayBusinessApi
  class EbayBusinessApiError < StandardError; end

  class Client # rubocop:disable Metrics/ClassLength
    include LedgerSync::Ledgers::Client::Mixin

    attr_reader :client_id, :client_secret, :redirect_uri

    EBAY_OAUTH_EBAY_ENDPOINT = 'https://api.ebay.com/identity/v1/oauth2/token'
    EBAY_CONSENT_EBAY_URL = 'auth.ebay.com'
    EBAY_EBAY_API_ENDPOINT = 'https://api.ebay.com'
    BASE_SCOPES = [
      'https://api.ebay.com/oauth/api_scope/buy.order.readonly',
      'https://api.ebay.com/oauth/api_scope/buy.order',
      'https://api.ebay.com/oauth/api_scope/commerce.catalog.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.identity.readonly'
    ].join(' ').freeze

    def initialize
      @client_id = setting('ebay_client_id')
      @client_secret = setting('ebay_client_secret')
      @redirect_uri = setting('ebay_redirect_uri')
    end

    # Application Token Flow
    # This is a one-step flow. It generates a 2 hours valid token.
    # With this token, we can interact with eBay's public APIs.
    # We can pull products, prices and other public data.
    # It doesn't give rights to do some user-related actions (Buying, Selling...)
    # https://developer.ebay.com/api-docs/static/oauth-client-credentials-grant.html
    def application_access_token
      application_access_data[:access_token]
    end

    def application_access_data
      post_request_oauth_endpoint(headers, access_token_body)
    end

    # User Grant Flow
    # This is a two-step flow. It generates an url first and then a token.
    # With the final token, you can do all user-related actions (Buying, Selling...)
    # https://developer.ebay.com/api-docs/static/oauth-authorization-code-grant.html

    # Step 1: Generate oAuth URL
    # This method returns an URL. Once the eBay user navigates to this URL..
    # .. he authorizes our eBay app to use his account to do some API actions.
    def consent_uri
      URI::HTTPS.build(
        host: EBAY_CONSENT_EBAY_URL,
        path: '/oauth2/authorize',
        query: URI.encode_www_form(
          client_id: client_id, locale: 'en-US',
          redirect_uri: redirect_uri, response_type: 'code',
          scope: BASE_SCOPES
        )
      ).to_s
    end

    # Step 2: Retrieve user access token with authorization code from Step 1
    def user_access_token(authorization_code)
      user_access_data(authorization_code)[:access_token]
    end

    def user_access_data(authorization_code)
      post_request_oauth_endpoint(
        headers,
        authorization_code_body(authorization_code)
      )
    end

    def api(http_method, path, opts = {})
      api_type = opts.fetch(:api_type, :read)

      request = LedgerSync::Ledgers::Request.new(
        body: opts.fetch(:body, nil),
        headers:  api_request_headers(api_type).merge(opts.fetch(:headers, {})),
        method: http_method,
        url: EBAY_EBAY_API_ENDPOINT + path,
        params: opts.fetch(:form_params, {})
      )

      request.perform
    end

    private

    def post_request_oauth_endpoint(headers, body)
      response = Typhoeus.post(
        EBAY_OAUTH_EBAY_ENDPOINT,
        { method: :post, headers: headers, body: body }
      )

      data = parse_response(response)

      raise_error(response, data) unless data[:access_token]
      data
    end

    def headers
      {
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Authorization' => "Basic #{encoded_credentials}"
      }
    end

    def api_request_headers(api_type)
      token = api_type == :read ? application_access_token : user_access_token
      {
        'Authorization' => "Bearer #{token}",
        'X-EBAY-C-MARKETPLACE-ID' => 'EBAY_US'
      }
    end

    def encoded_credentials
      Base64.strict_encode64("#{client_id}:#{client_secret}")
    end

    def access_token_body
      {
        'grant_type' => 'client_credentials',
        'scope' => 'https://api.ebay.com/oauth/api_scope'
      }
    end

    def authorization_code_body(authorization_code)
      {
        'grant_type' => 'authorization_code',
        'code' => authorization_code,
        'redirect_uri' => redirect_uri
      }
    end

    def setting(key)
      Setting[key] ||
        raise(EbayBusinessApiError, "Please set #{key} in DB settings !")
    end

    def parse_response(response)
      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError
      raise EbayBusinessApiError, "Invalid JSON response: #{response.body}"
    end

    def raise_error(response, data)
      error_details = "CODE: #{response.code} - #{data[:error]}: #{data[:error_description]}"

      raise EbayBusinessApiError, error_details.to_s
    end
  end
end
