# frozen_string_literal: true

require 'typhoeus'
require 'base64'
require 'json'
require 'uri'

module EbayBusinessApi
  class EbayBusinessApiError < StandardError; end

  class Client # rubocop:disable Metrics/ClassLength
    include LedgerSync::Ledgers::Client::Mixin

    attr_reader :client_id, :client_secret, :redirect_uri, :sandbox

    BASE_SCOPES = [
      'https://api.ebay.com/oauth/api_scope',
      'https://api.ebay.com/oauth/api_scope/buy.order.readonly',
      'https://api.ebay.com/oauth/api_scope/buy.guest.order',
      'https://api.ebay.com/oauth/api_scope/sell.marketing.readonly',
      'https://api.ebay.com/oauth/api_scope/sell.marketing',
      'https://api.ebay.com/oauth/api_scope/sell.inventory.readonly',
      'https://api.ebay.com/oauth/api_scope/sell.inventory',
      'https://api.ebay.com/oauth/api_scope/sell.account.readonly',
      'https://api.ebay.com/oauth/api_scope/sell.account',
      'https://api.ebay.com/oauth/api_scope/sell.fulfillment.readonly',
      'https://api.ebay.com/oauth/api_scope/sell.fulfillment',
      'https://api.ebay.com/oauth/api_scope/sell.analytics.readonly',
      'https://api.ebay.com/oauth/api_scope/sell.marketplace.insights.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.catalog.readonly',
      'https://api.ebay.com/oauth/api_scope/buy.shopping.cart',
      'https://api.ebay.com/oauth/api_scope/buy.offer.auction',
      'https://api.ebay.com/oauth/api_scope/commerce.identity.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.identity.email.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.identity.phone.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.identity.address.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.identity.name.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.identity.status.readonly',
      'https://api.ebay.com/oauth/api_scope/sell.finances',
      'https://api.ebay.com/oauth/api_scope/sell.payment.dispute',
      'https://api.ebay.com/oauth/api_scope/sell.item.draft',
      'https://api.ebay.com/oauth/api_scope/sell.item',
      'https://api.ebay.com/oauth/api_scope/sell.reputation',
      'https://api.ebay.com/oauth/api_scope/sell.reputation.readonly',
      'https://api.ebay.com/oauth/api_scope/commerce.notification.subscription',
      'https://api.ebay.com/oauth/api_scope/commerce.notification.subscription.readonly',
      'https://api.ebay.com/oauth/api_scope/sell.stores',
      'https://api.ebay.com/oauth/api_scope/sell.stores.readonly'
    ].join(' ').freeze

    def initialize(sandbox: false)
      @client_id = sandbox ? ENV['CLIENT_ID_SANDBOX'] : ENV['CLIENT_ID']
      @client_secret = sandbox ? ENV['CLIENT_SECRET_SANDBOX'] : ENV['CLIENT_SECRET']
      @redirect_uri = sandbox ? ENV['REDIRECT_URI_SANDBOX'] : ENV['REDIRECT_URI']
      @sandbox = sandbox

      validate_credentials!
    end

    # Application Token Flow
    # This is a one-step flow. It generates a 2 hours valid token.
    # With this token, we can interact with eBay's public APIs.
    # We can pull products, prices and other public data.
    # It doesn't give rights to do some user-related actions (Buying, Selling...)
    # https://developer.ebay.com/api-docs/static/oauth-client-credentials-grant.html
    def application_access_token
      @application_access_token ||= post_request_oauth_endpoint(headers, access_token_body)
    end

    # Credentials Grant Flow
    # This is a two-step flow. It generates an url first and then a token.
    # With the final token, you can do all user-related actions (Buying, Selling...)
    # https://developer.ebay.com/api-docs/static/oauth-authorization-code-grant.html

    # Step 1: Generate oAuth URL
    # This method returns an URL. Once the eBay user navigates to this URL..
    # .. he authorizes our eBay app to use his account to do some API actions.
    def build_consent_uri
      URI::HTTPS.build(
        host: consent_endpoint_url,
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
      @user_access_token ||= post_request_oauth_endpoint(
        headers,
        authorization_code_body(authorization_code)
      )
    end

    private

    def validate_credentials!
      if client_id.nil? || client_secret.nil? || redirect_uri.nil?
        raise '[eBay Business API] Set-up eBay credentials before using this gem !'
      end

      true
    end

    def post_request_oauth_endpoint(headers, body)
      response = Typhoeus.post(
        oauth_endpoint_url,
        { method: :post, headers: headers, body: body }
      )

      data = parse_response(response)

      raise_error(response, data) unless data[:access_token]

      data[:access_token]
    end

    def oauth_endpoint_url
      sandbox ? ENV['OAUTH_EBAY_SANDBOX_ENDPOINT'] : ENV['OAUTH_EBAY_PROD_ENDPOINT']
    end

    def consent_endpoint_url
      sandbox ? ENV['CONSENT_EBAY_SANDBOX_URL'] : ENV['CONSENT_EBAY_PROD_URL']
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
