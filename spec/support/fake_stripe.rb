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

  get "/v1/invoices/upcoming" do
    content_type :json

    customer_invoice.to_json
  end

  get "/v1/invoices/:id" do
    content_type :json

    case params[:id]
    when INVOICE_ID
      customer_invoice.to_json
    end
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
            id: "sub_BR508hMxoCPe0V",
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
      subscription: "sub_BR508hMxoCPe0V",
      subtotal: 900,
      tax: nil,
      tax_percent: nil,
      total: 900,
      webhooks_delivered_at: nil
    }
  end
end

FakeStripeRunner = Capybara::Discoball::Runner.new(FakeStripe) do |server|
  url = "http://#{server.host}:#{server.port}"
  Stripe.api_base = url
end
