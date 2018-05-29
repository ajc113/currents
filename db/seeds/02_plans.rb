puts "\nCreating Plans"

plans = [
  {
    name: "Monthly",
    stripe_id: "monthly",
    price: 16.99
  },
  {
    name: "Yearly",
    stripe_id: "yearly",
    price: 99.99
  }
]

def create_plan plan
  Stripe::Plan.create(
    id: plan[:stripe_id],
    name: plan[:name],
    amount: (plan[:price] * 100).round(0),
    currency: "usd",
    interval: interval(plan[:stripe_id])
  )
  puts "Plan - '#{plan[:name]}' is created on Stripe!"
end

def interval id
  id.match(/month/i) ? 'month' : 'year'
end

plans.each do |plan|
  Plan.find_or_create_by!(plan)

  begin
    Stripe::Plan.retrieve plan[:stripe_id] unless plan[:name] == "Free"
    puts "Plan #{plan[:name]} already exists!"
  rescue Stripe::InvalidRequestError => error
    if error.message.gsub(/No Such Plan/i)
      puts "Plan #{plan[:name]} does not exist on Stripe! Creating it"
      create_plan plan
    else
      raise
    end
  end
end

