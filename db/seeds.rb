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
    # accepted_terms_at: Time.zone.now,
    # accepted_privacy_at: Time.zone.now,
    terms_of_service: true
  )
end

puts " "
puts "clients"
100.times do
  account_id = Account.pluck(:id).shuffle.first
  Client.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.first_name,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    account_id: account_id
  )
end

# puts " "
# puts "Account Clients"
# Client.all.each do |c|
#   account_id = Account.pluck(:id).shuffle.first
#   AccountClient.create(
#     account_id: account_id,
#     client_id: c.id
#   )
# end

puts " "
puts "client profiles"
Client.all.each do |c|
  ClientProfile.create!(
    client_id: c.id,
    account_id: c.account_id,
    reminder_message: Faker::TvShows::MichaelScott.quote
  )
end

puts " "
puts "done"