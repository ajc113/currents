class Invoice

  attr_reader :stripe_invoice

  def self.find_all_by_user(user)
    stripe_invoices_for_user(user).map do |invoice|
      new(invoice)
    end
  end

  def initialize(invoice_id_or_object)
    if invoice_id_or_object.is_a? String
      @stripe_invoice = retrieve(invoice_id_or_object)
    else
      @stripe_invoice = invoice_id_or_object
    end
  end

  def to_partial_path
    "invoices/#{self.class.name.underscore}"
  end

  def id
    stripe_invoice.id
  end

  def number
    stripe_invoice.number
  end

  def total
    stripe_invoice.total
  end

  def date
    convert_stripe_time(stripe_invoice.date)
  end

  def paid
    stripe_invoice.paid
  end

  def subscription
    stripe_invoice.subscription
  end

  def period_start
    convert_stripe_time(stripe_invoice.period_start)
  end

  def period_end
    convert_stripe_time(stripe_invoice.period_end)
  end

  def user
    @user ||= User.find_by(stripe_customer_id: stripe_invoice.customer)
  end
  
  private

  def self.stripe_invoices_for_user(user)
    Stripe::Invoice.all(customer: user.stripe_customer_id).data
  end

  def retrieve(invoice_id)
    Stripe::Invoice.retrieve(invoice_id)
  end

  def convert_stripe_time(time)
    Time.zone.at(time).strftime('%D')
  end
end
