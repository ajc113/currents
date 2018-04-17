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
  def fake_stripe_customer(id)
    {
      object: "customer",
      created: 1359583041,
      id: id,
      livemode: false,
      description: CUSTOMER_EMAIL,
      email: CUSTOMER_EMAIL,
      delinquent: false,
      metadata: {},
      subscriptions: {
        object: "list",
        total_count: 1,
        has_more: false,
        url: "/v1/customers/#{id}/subscriptions"
      },
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
