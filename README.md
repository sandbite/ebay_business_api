# EbayBusinessApi

A gem to interact with eBay API using LedgerSync operations.

## Setup eBay Developer Interface

- Before using this gem, you'll need to set up a Developer account on https://developer.ebay.com/.
- Make sure to create your first application and obtain your `CLIENT ID` and `CLIENT SECRET` keys from (https://developer.ebay.com/my/keys)
- Additionally, register a test user (`Register a new Sandbox user`) and obtain a token for that user from (https://developer.ebay.com/my/auth)

At this point, you should have your client keys ( `CLIENT ID`/`CLIENT SECRET`) and your user keys (`REDIRECT_URI`).

## Client initialization

To initialize the client, you'll need to set environment variables. Some of these variables are predefined (such as endpoints and environments), while others (like credentials) must be set manually:
```sh
CLIENT_ID=
CLIENT_SECRET=
REDIRECT_URI=

CLIENT_ID_SANDBOX=
CLIENT_SECRET_SANDBOX=
REDIRECT_URI_SANDBOX=
```

Once these credentials are set, you can initialize the client like this:
```ruby
client = EbayBusinessApi::Client.new
```

If you want to enable sandbox mode, pass a parameter:
```ruby
client = EbayBusinessApi::Client.new(sandbox: true)
```

If any of these credentials are missing, an error will be raised.

## The OAuth process

The eBay API uses an OAuth 2.0 authentication process to allow applications to securely interact with eBay services. There are two types of tokens that you can obtain depending on your use case:

### 1. Application Access Token (Client Credentials Flow)

- This flow is straightforward and requires only one step.
- The application access token is used to interact with eBay’s public APIs.
- It is valid for 2 hours and allows actions like pulling public data (e.g., product details, pricing, etc.).
- Limitations: It cannot be used for actions that require user permissions, such as buying or selling items.

How to get a token:
```ruby
client.application_access_token
```

### 2. User Access Token (Authorization Code Grant Flow)

This is a two-step process and is required for actions that involve user-related permissions, such as buying, selling, or managing eBay accounts.

- Step 1: Generate an OAuth URL with the required CLIENT_ID, REDIRECT_URI, and requested SCOPES. The user must visit this URL and log in to eBay to grant your app permissions.
- Step 2: After the user authorizes your app, eBay redirects them back to the specified REDIRECT_URI with an authorization code. Use this code to request a user access token from the OAuth endpoint.

Once obtained, the user access token can be used to perform user-specific actions like creating listings, managing orders, or accessing account data.

How to get a token:
```ruby
# First step, generate the grant url
client.build_consent_uri

# Second step, once you received the authorization_code on your callback controller action
client.user_access_token(authorization_code)
```

## Browse API
If you want to search in eBay's catalog, you need to use this API.

```ruby
resource = EbayBusinessApi::Browse.new(q: 'drone')
operation = EbayBusinessApi::Browse::Operations::Search.new(client: client, resource: resource)
operation.perform
```
