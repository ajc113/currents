puts "Creating users"
2.times do |i|
  begin
    User.create!(
      email: FFaker::Internet.email,
      confirmed_at: DateTime.now,
      password: 'password'
    )
    print '.'
  rescue ActiveRecord::RecordInvalid
    print 'F'
  end
end

puts "\nCreating real users"

real_users = [
  {
    email: "tannakartikey@gmail.com"
  },
  {
    email: "ajc113@gmail.com"
  },
  {
    email: "k.subbarao1991@gmail.com"
  }
]

real_users.each do |user|
  begin
    User.create!(
      email: user[:email],
      password: 'password',
      confirmed_at: DateTime.now
    )
    print '.'
  rescue
    ActiveRecord::RecordInvalid
    print 'F'
  end
end

puts "\nCreating Admin user"

AdminUser.create!(
  email: "admin@example.com",
  password: "password",
)

puts "Now you can login with admin@example.com with the password `password`"
