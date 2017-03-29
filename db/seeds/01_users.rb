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

  # {
  #   email: "costa.aj@gmail.com",
  #   password: "password",
  # },
  #  {
  #   email: "ajcosta1@gmail.com",
  #   password: "password",
  # },

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
  email: "",
  password: "",
)

puts "Now you can login with email with the password `password`"
