# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# Uncomment the following to create an Admin user for Production in Jumpstart Pro
# User.create name: "name", email: "email", password: "password", password_confirmation: "password", admin: true, terms_of_service: true

puts "users & accounts"
10.times do 
  User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    password: "password",
    accepted_terms_at: Time.zone.now,
    accepted_privacy_at: Time.zone.now,
    terms_of_service: true
  )
end

users = User.all

# 10.times do 
#   Account.create!(
#     name: Faker::Company.name,
#     owner_id: users.pluck(:id).shift()
#   )
# end

# accounts = Account.all.pluck(:id)

puts "clients"
100.times do
  account_id = Array(3..12).shuffle.first
  # puts "account id = #{account_id}"
  Client.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    account_id: account_id,
    password: "password"
  )
end

clients = Client.all.pluck(:id)

puts "client profiles"
100.times do
  ClientProfile.create!(
    client_id: clients.shift(),
    reminder_message: Faker::TvShows::MichaelScott.quote
  )
end

puts " "
puts "done"