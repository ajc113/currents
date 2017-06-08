puts "\nCreating real users"

real_users = [

  {
    email: "costa.aj@gmail.com",
  },
  {
    email: "ajcosta1@gmail.com",
  },

]

real_users.each do |user|
  begin
    User.create!(
      email: user[:email],
      password: 'password',
      confirmed_at: DateTime.now,
      state_waters: State.visible.order("RANDOM()").first.name,
    )
    print '.'
  rescue
    ActiveRecord::RecordInvalid
    print 'F'
  end
end

puts "\nCreating Admin user"

AdminUser.create!(
  email: "costa.aj@gmail.com",
  password: "password",
)

puts "Now you can login with email with the password `password`"
