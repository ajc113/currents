require "sinatra/base"
require "capybara_discoball"

class FakeStripe < Sinatra::Base
  EVENT_ID_FOR_SUCCESSFUL_INVOICE_PAYMENT = "evt_1X6Z2OXmhBVcm9"
  EVENT_ID_FOR_INVOICE_PAYMENT_FOR_UNSUBSCRIBED_USER = "evt_3X6Z2OXmhBVcm9"
  EVENT_ID_FOR_SUBSCRIPTION_UPDATE = "evt_2X6Z2OXmhBVc11"
  EVENT_ID_FOR_SUBSCRIPTION_DELETION = "evt_2X6Z2OXmhBVcm9"
  CUSTOMER_ID = "cus_1CXxPJDpw1VLvJ"
  CUSTOMER_EMAIL = "foo@bar.com"
  INVOICE_ID = "in_1s4JSgbcUaElzU"
  PLAN_ID = "JAVA-PLAN-1b3a5c51-5c1a-421b-8822-69138c2d937b"
  SUBSCRIPTION_ID = "sub_4uJxAs8DlW3Z0w"
  SUBSCRIPTION_BILLING_PERIOD_END = 1361234235

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
      date: 1369159688,
      id: INVOICE_ID,
      period_start: 1366567645,
      period_end: 1369159645,
      lines: {
        object: "list",
        total_count: 1,
        has_more: false,
        url: "/v1/invoices/in_1s4JSgbcUaElzU/lines",
        data: [
          {
            id: "sub_1ri03Utwow0Sue",
            object: "line_item",
            type: "subscription",
            livemode: true,
            amount: 9900,
            currency: "usd",
            proration: false,
            period: {
              start: 1371755084,
              end: 1374347084
            },
            quantity: 1,
            plan: {
              interval: "month",
              name: I18n.t("shared.subscription.name"),
              created: 1367971199,
              amount: 9900,
              currency: "usd",
              id: "upcase",
              object: "plan",
              livemode: false,
              interval_count: 1,
              trial_period_days: nil,
              metadata: {},
              statement_description: nil
            },
            description: nil,
            metadata: nil
          }
        ],
      },
      subtotal: 9900,
      total: 7900,
      customer: CUSTOMER_ID,
      object: "invoice",
      attempted: true,
      closed: true,
      forgiven: false,
      paid: true,
      livemode: false,
      attempt_count: 1,
      amount_due: 7900,
      currency: "usd",
      starting_balance: 0,
      ending_balance: 0,
      next_payment_attempt: nil,
      webhooks_delivered_at: 1403972754,
      charge: "ch_JQhSfU9Rz21owt",
      discount: {
        coupon: {
          id: "railsconf",
          created: 1410384799,
          percent_off: nil,
          amount_off: 2000,
          currency: "usd",
          object: "coupon",
          livemode: false,
          duration: "once",
          redeem_by: 1367971199,
          max_redemptions: nil,
          times_redeemed: 1,
          duration_in_months: nil,
          valid: true,
          metadata: {}
        },
        start: 1336671710,
        object: "discount",
        customer: CUSTOMER_ID,
        subscription: nil,
        end: 1339350110
      },
      application_fee: nil,
      subscription: "sub_3Xehu54zpkQS1b",
      description: nil,
      receipt_number: nil
    }
  end
end

FakeStripeRunner = Capybara::Discoball::Runner.new(FakeStripe) do |server|
  url = "http://#{server.host}:#{server.port}"
  Stripe.api_base = url
end
