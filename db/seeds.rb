password = "bonjour"

User.roles.each do |(role, _)|
  user = User.find_or_initialize_by(email: "#{role}@leivainvesting.com")
  user.assign_attributes(
    first_name: role.to_s,
    last_name: "Investing",
    role: role,
    password: password,
    password_confirmation: password
  )
  user.save! validate: false
end
