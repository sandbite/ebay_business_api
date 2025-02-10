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

How to get a token and its expiration date:
```ruby
client.application_access_data
```

### 2. User Access Token (Authorization Code Grant Flow)

This is a two-step process and is required for actions that involve user-related permissions, such as buying, selling, or managing eBay accounts.

- Step 1: Generate an OAuth URL with the required CLIENT_ID, REDIRECT_URI, and requested SCOPES. The user must visit this URL and log in to eBay to grant your app permissions.
- Step 2: After the user authorizes your app, eBay redirects them back to the specified REDIRECT_URI with an authorization code. Use this code to request a user access token from the OAuth endpoint.

Once obtained, the user access token can be used to perform user-specific actions like creating listings, managing orders, or accessing account data.

How to get a token:
```ruby
# First step, generate the grant url
client.consent_uri

# Second step, once you received the authorization_code on your callback controller action
client.user_access_token(authorization_code)
```

## Browse API (Search)
If you want to search in eBay's catalog, you need to use this API.

```ruby
resource = EbayBusinessApi::Browse.new(q: 'drone')
operation = EbayBusinessApi::Browse::Operations::Search.new(client: client, resource: resource)
operation.perform
```

## Browse API (Find)
If you want to find by Item ID in eBay's catalog, you need to use this API.

```ruby
resource = EbayBusinessApi::GetItem.new(item_id: 'v1|145536784037|0')
operation = EbayBusinessApi::GetItem::Operations::Find.new(client: client, resource: resource)
operation.perform
```

## Order V1 API (Initiate Checkout)

This method creates an eBay member checkout session, which is the first step in performing a checkout. You use this method to create a checkout session before you can process a checkout. If the address submitted cannot be validated, a warning message will be returned.

The method returns a checkoutSessionId that you use as a URI parameter in subsequent checkout methods.

```ruby
billing_address = EbayBusinessApi::BillingAddress.new(
  address_line1: "Al Mezan Tower",
  address_line2: "Muhaisnah 4",
  city: "Dubai",
  country: "AE",
  county: "UAE",
  first_name: "Jean-Michel",
  last_name: "KEULEYAN",
  postal_code: "11111",
  state_or_province: "Dubai"
)

credit_card = EbayBusinessApi::CreditCard.new(
  account_holder_name: 'Jean Michel',
  billing_address: billing_address
  brand: "VISA",
  card_number: "123456789",
  cvv_number: "123",
  expire_month: "10",
  expire_year: "28"
)

client = EbayBusinessApi::Client.new
shipping_address = EbayBusinessApi::ShippingAddress.new(
   address_line1: "Al Mezan Tower",
   address_line2: "Muhaisnah 4",
   city: "Dubai",
   state_or_province: "Dubai",
   postal_code: "11111",
   country: "AE",
   recipient: "Jean Michel",
   phone_number: "+971505050505"
)

line_item_inputs = [
  EbayBusinessApi::LineItemInput.new(
    quantity: '1',
    item_id: 'v1|145536784037|0'
  ),
  EbayBusinessApi::LineItemInput.new(
    quantity: '3',
    item_id: 'v1|373530480350|0'
  )
]

resource = EbayBusinessApi::CheckoutSession.new(
  shipping_address: shipping_address,
  line_item_inputs: line_item_inputs
)

operation = EbayBusinessApi::CheckoutSession::Operations::Create.new(client: client, resource: resource)
operation.perform
```
