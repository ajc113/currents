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

puts "\nCreating login user and admin user"

User.create!(
  email: "user@example.com",
  password: "password",
  confirmed_at: DateTime.now
)

AdminUser.create!(
  email: "admin@example.com",
  password: "password",
)
puts "Now you can login with user@example.com and admin@example.com with the password `password`"
