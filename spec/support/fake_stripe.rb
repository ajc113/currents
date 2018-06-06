require "sinatra/base"
require "capybara_discoball"

class FakeStripe < Sinatra::Base
  EVENT_ID_FOR_SUCCESSFUL_INVOICE_PAYMENT = "evt_1X6Z2OXmhBVcm9"
  EVENT_ID_FOR_INVOICE_PAYMENT_FOR_UNSUBSCRIBED_USER = "evt_3X6Z2OXmhBVcm9"
  EVENT_ID_FOR_SUBSCRIPTION_UPDATE = "evt_2X6Z2OXmhBVc11"
  EVENT_ID_FOR_SUBSCRIPTION_DELETION = "evt_2X6Z2OXmhBVcm9"
  CUSTOMER_ID = "cus_dummy_stripe"
  CUSTOMER_EMAIL = "foo@bar.com"
  INVOICE_ID = "in_1s4JSgbcUaElzU"
  PLAN_ID = "JAVA-PLAN-1b3a5c51-5c1a-421b-8822-69138c2d937b"
  SUBSCRIPTION_ID = "sub_4uJxAs8DlW3Z0w"
  SUBSCRIPTION_BILLING_PERIOD_END = 1361234235
  SOURCE = "src_abcdefghijkl"

  cattr_reader :last_charge, :last_customer_email, :last_token, :coupons, :customer_plan_id, :last_coupon_used, :customer_plan_quantity
  cattr_accessor :coupons, :customer_ids, :failure

  def self.reset
    self.coupons = {}
    self.customer_ids = [CUSTOMER_ID]
    self.failure = nil
  end

  get "/v1/tokens" do
    content_type "application/javascript"

    "#{params[:callback]}(#{source.to_json}, 201)"
  end

  get "/v1/invoices" do
    content_type :json
    {
      object: "list",
      count: 1,
      url: "/v1/invoices",
      data: [
        customer_invoice
      ]
    }.to_json
  end

  get "/v1/invoices/upcoming" do
    content_type :json

    customer_invoice.to_json
  end

  get "/v1/invoices/:id" do
    content_type :json

    case params[:id]
    when INVOICE_ID
      customer_invoice.to_json
    else
      {
        'something': 'valuable'
      }.to_json
    end
  end

  get "/v1/customers/:id" do
    content_type :json

    case params[:id]
    when CUSTOMER_ID
      customer(params[:id]).to_json
    else
      status 401
    end
  end

  get "/v1/subscriptions/:id" do
    content_type :json

    case params[:id]
    when SUBSCRIPTION_ID
    {
      id: SUBSCRIPTION_ID,
      customer: CUSTOMER_ID
    }.to_json
    end
  end

  get "/v1/customers/:id/subscriptions" do
    case params[:id]
    when CUSTOMER_ID
      {
        total_count: 1
      }.to_json
    end
  end

  post "/v1/subscriptions" do
    content_type :json

    {
      id: SUBSCRIPTION_ID
    }.to_json
  end

  post "/v1/customers" do
    content_type :json
    
    {
      id: CUSTOMER_ID
    }.to_json
  end

  post "/v1/customers/:id" do
    content_type :json

    case params[:id]
    when CUSTOMER_ID
      {
        id: CUSTOMER_ID,
        subscription_id: SUBSCRIPTION_ID
      }.to_json
    end
  end

  delete "/v1/customers/:id" do
    content_type :json
    case params[:id]
    when CUSTOMER_ID
      {
        "deleted": true,
        "id": CUSTOMER_ID
      }.to_json
    end
  end

  delete "/v1/subscriptions/:id" do
    case params[:id]
    when SUBSCRIPTION_ID
      {
        id: SUBSCRIPTION_ID,
        customer: CUSTOMER_ID
      }.to_json
    end
  end

  delete "/v1/customers/:id/sources/:source" do
    content_type :json

    {
      id: "src_1BDT3BLl1LzrhllYSAFu2MMu",
      object: "source",
      amount: nil,
      client_secret: "src_client_secret_BaeLB3dFzUd6tmmZsiYl8Moq",
      created: 1508139013,
      currency: nil,
      flow: "none",
      livemode: false,
      metadata: {},
      owner:
      {
        address:
        {
          city: nil,
          country: nil,
          line1: nil,
          line2: nil,
          postal_code: "Error commodo voluptate officiis ad eveniet quas",
          state: nil
        },
        email: nil,
        name: "Mollie Salinas",
        phone: "+774-89-6785446",
        verified_address: nil,
        verified_email: nil,
        verified_name: nil,
        verified_phone: nil,
      },
      statement_descriptor: nil,
      status: "consumed",
      type: "card",
      usage: "reusable",
      card:
      {
        exp_month: 4,
        exp_year: 2024,
        address_zip_check: "unchecked",
        brand: "Visa",
        country: "US",
        cvc_check: "unchecked",
        fingerprint: "0Kb8LJC2bIUK0qfS",
        funding: "credit",
        last4: "4242",
        three_d_secure: "optional",
        address_line1_check: nil,
        tokenization_method: nil,
        dynamic_last4: nil
      }
    }.to_json
  end

  def source
    {
      "id": "src_1AzqOHLl1LzrhllYoncK7PI3",
      "object": "source",
      "amount": nil,
      "client_secret": "src_client_secret_BMZXUqH8820q8Pdx7RmWyVao",
      "created": 1504892141,
      "currency": nil,
      "flow": "none",
      "livemode": false,
      "metadata": {},
      "owner": {
        "address": {
          "city": nil,
          "country": nil,
          "line1": nil,
          "line2": nil,
          "postal_code": "12221",
          "state": nil
        },
        "email": nil,
        "name": "Jane Doe",
        "phone": "1231231231",
        "verified_address": nil,
        "verified_email": nil,
        "verified_name": nil,
        "verified_phone": nil
      },
      "statement_descriptor": nil,
      "status": "chargeable",
      "type": "card",
      "usage": "reusable",
      "card": {
        "exp_month": 11,
        "exp_year": 2022,
        "address_zip_check": "unchecked",
        "brand": "Visa",
        "country": "US",
        "cvc_check": "unchecked",
        "funding": "credit",
        "last4": "4242",
        "three_d_secure": "optional",
        "address_line1_check": nil,
        "tokenization_method": nil,
        "dynamic_last4": nil
      }
    }
  end

  def customer_invoice
    {
      id: INVOICE_ID,
      object: "invoice",
      amount_due: 900,
      application_fee: nil,
      attempt_count: 0,
      attempted: false,
      billing: "charge_automatically",
      charge: nil,
      closed: false,
      currency: "usd",
      customer: CUSTOMER_ID,
      date: 1508524062,
      description: nil,
      discount: nil,
      ending_balance: nil,
      forgiven: false,
      lines: {
        object: "list",
        data: [
          {
            id: SUBSCRIPTION_ID,
            object: "line_item",
            amount: 900,
            currency: "usd",
            description: nil,
            discountable: true,
            livemode: false,
            metadata: {
              automatic: "true"
            },
            period: {
              start: 1508524060,
              end: 1511202460
            },
            plan: {
              id: "monthly",
              object: "plan",
              amount: 900,
              created: 1504073905,
              currency: "usd",
              interval: "month",
              interval_count: 1,
              livemode: false,
              metadata: {
              },
              name: "Monthly",
              statement_descriptor: nil,
              trial_period_days: nil
            },
            proration: false,
            quantity: 1,
            subscription: nil,
            subscription_item: "si_1B4CqMLl1LzrhllYIci3hTkg",
            type: "subscription"
          }
        ],
        has_more: false,
        total_count: 1,
        url: "/v1/invoices/#{INVOICE_ID}/lines"
      },
      livemode: false,
      metadata: {
      },
      next_payment_attempt: 1508527662,
      number: "b9181a962e-0003",
      paid: true,
      period_end: 1508524060,
      period_start: 1505932060,
      receipt_number: nil,
      starting_balance: 0,
      statement_descriptor: nil,
      subscription: SUBSCRIPTION_ID,
      subtotal: 900,
      tax: nil,
      tax_percent: nil,
      total: 900,
      webhooks_delivered_at: nil
    }
  end

  def customer(id = CUSTOMER_ID)
    {
      object: "customer",
      created: 1359583041,
      id: id,
      livemode: false,
      description: CUSTOMER_EMAIL,
      email: CUSTOMER_EMAIL,
      delinquent: false,
      metadata: {},
      discount: nil,
      account_balance: 0,
      currency: "usd",
      cards: {
        object: "list",
        total_count: 1,
        has_more: false,
        url: "/v1/customers/#{id}/cards"
      },
      default_source: "src_1BDT3BLl1LzrhllYSAFu2MMu",
      default_card: "card_2NCtCAVwvnMUUs",
      sources:
      {
        object: "list",
        data: [{
          id: "src_1BDT3BLl1LzrhllYSAFu2MMu",
          object: "source",
          amount: nil,
          client_secret: "src_client_secret_BaeLB3dFzUd6tmmZsiYl8Moq",
          created: 1508139013,
          currency: nil,
          customer: "cus_BJ1cLzc7y1qKmK",
          flow: "none",
          livemode: false,
          metadata: {},
          owner: {
            address: {
              city: nil,
              country: nil,
              line1: nil,
              line2: nil,
              postal_code: "Error commodo voluptate officiis ad eveniet quas",
              state: nil
            },
            email: nil,
            name: "Mollie Salinas",
            phone: "+774-89-6785446",
            verified_address: nil,
            verified_email: nil,
            verified_name: nil,
            verified_phone: nil
          },
          statement_descriptor: nil,
          status: "chargeable",
          type: "card",
          usage: "reusable",
          card: {
            exp_month: 4,
            exp_year: 2024,
            address_zip_check: "unchecked",
            brand: "Visa",
            country: "US",
            cvc_check: "unchecked",
            fingerprint: "0Kb8LJC2bIUK0qfS",
            funding: "credit",
            last4: "4242",
            three_d_secure: "optional",
            address_line1_check: nil,
            tokenization_method: nil,
            dynamic_last4: nil
          }
        }],
        has_more: false,
        total_count: 1,
        url: "/v1/customers/cus_BJ1cLzc7y1qKmK/sources"
      },
      subscriptions:
      {
        object: "list",
        data: [{
          id: "sub_Bae7GaNX4y11ST",
          object: "subscription",
          application_fee_percent: nil,
          billing: "charge_automatically",
          cancel_at_period_end: false,
          canceled_at: nil,
          created: 1508138142,
          current_period_end: 1510816542,
          current_period_start: 1508138142,
          customer: "cus_BJ1cLzc7y1qKmK",
          discount: nil,
          ended_at: nil,
          items: {
            object: "list",
            data: [{
              id: "si_1BDSp8Ll1LzrhllYeT423SwH",
              object: "subscription_item",
              created: 1508138142,
              metadata: {},
              plan: {
                id: "monthly",
                object: "plan",
                amount: 900,
                created: 1504073905,
                currency: "usd",
                interval: "month",
                interval_count: 1,
                livemode: false,
                metadata: {},
                name: "Monthly",
                statement_descriptor: nil,
                trial_period_days: nil
              },
              quantity: 1
            }],
            has_more: false,
            total_count: 1,
            url: "/v1/subscription_items?subscription=sub_Bae7GaNX4y11ST"
          },
          livemode: false,
          metadata: {
            automatic: "true"
          },
          plan: {
            id: "monthly",
            object: "plan",
            amount: 900,
            created: 1504073905,
            currency: "usd",
            interval: "month",
            interval_count: 1,
            livemode: false,
            metadata: {},
            name: "Monthly",
            statement_descriptor: nil,
            trial_period_days: nil
          },
          quantity: 1,
          start: 1508138142,
          status: "active",
          tax_percent: nil,
          trial_end: nil,
          trial_start: nil
        }],
        has_more: false,
        total_count: 1,
        url: "/v1/customers/cus_BJ1cLzc7y1qKmK/subscriptions"
      }
    }
  end
end

FakeStripeRunner = Capybara::Discoball::Runner.new(FakeStripe) do |server|
  url = "http://#{server.host}:#{server.port}"
  Stripe.api_base = url
end

RSpec.configure do |config|
  config.before { FakeStripe.reset }
end

#Stripe.verify_ssl_certs = false

module Stripe
  # Overriding this so it does not warn us about turning off SSL
  def self.ssl_preflight_passed?
    true
  end
end
