puts "Deleting database.."
Confirmation.destroy_all
Store.destroy_all
User.destroy_all

puts "Creating Users.."

puts "Creating Customers.."

one = User.create!(fname: "one", lname: "last", username: "one", email: "one@email.com", password: "123", type: Customer)
two = User.create!(fname: "two", lname: "last", username: "two", email: "two@email.com", password: "123", type: Customer)
three = User.create!(fname: "three", lname: "last", username: "three", email: "three@email.com", password: "123", type: Customer)
four = User.create!(fname: "four", lname: "last", username: "four", email: "four@email.com", password: "123", type: Customer)
one.save!

puts "Creating Businesses.."

saq = User.create!(fname: "john", lname: "doe", username: "saq", email: "saq@email.com", password: "123", type: BusinessUser)
sqdc = User.create!(fname: "jane", lname: "doe", username: "sqdc", email: "sqdc@email.com", password: "123", type: BusinessUser)
iga = User.create!(fname: "jj", lname: "doe", username: "iga", email: "iga@email.com", password: "123", type: BusinessUser)
saq.save!

puts "Creating Stores.."

saq_express = Store.new(name: "Saq Express", address: "954 Decarie montreal quebec", capacity: "10", message: "You are now waiting in line for SAQ. You must be 18 and older to enter the store. Thank you for using NotifiQ!")
saq_express.user = saq
saq_express.save!

sqdc_berri = Store.new(name: "SQDC Berri", address: "123 Berri montreal quebec", capacity: "10", message: "You're now closer to enter the SQDC! Please remember to wear your mask inside the store. Thank you for your understanding.")
sqdc_berri.user = sqdc
sqdc_berri.save

iga_lasalle = Store.new(name: "IGA LaSalle", address: "123 LaSalle montreal quebec", capacity: "10", message: "You are now waiting to get in IGA. Please remember to wear your mask and wash your hand. Check out iga.ca for details on this month's special. Thank you for using NotifiQ!")
iga_lasalle.user = iga
iga_lasalle.save

<<<<<<< HEAD
# puts "Creating Confirmations.."
# now = Time.now
# end_time = now + 1.hour

# tep = Confirmation.new(start_time: now, end_time: end_time, position: 1)
# tep.user_id = one.id
# tep.store = saq_express
# tep.save!
# tep.update_attribute :created_at, (10).days.ago
# tep.save!


# confirm_one = Confirmation.new(start_time: now + 30.minutes, end_time: end_time + 30.minutes, position: 1)
# confirm_one.user_id = two.id
# confirm_one = sqdc_berri
# confirm_one.save

# confirm_two = Confirmation.new(start_time: now + 45.minutes, end_time: end_time + 45.minutes, position: 1)
# confirm_two.user_id =three.id
# confirm_two = iga_lasalle
# confirm_two.save
=======
puts "Creating Confirmations.."
now = Time.now
end_time = now + 1.hour

tep = Confirmation.new(start_time: now, end_time: end_time, position: 1, expected_visit_time: 0)
tep.user_id = one.id
tep.store = saq_express
tep.save!
tep.update_attribute :created_at, (10).days.ago
tep.save!


confirm_one = Confirmation.new(start_time: now + 30.minutes, end_time: end_time + 30.minutes, position: 1)
confirm_one.user_id = two.id
confirm_one = sqdc_berri
confirm_one.save

confirm_two = Confirmation.new(start_time: now + 45.minutes, end_time: end_time + 45.minutes, position: 1)
confirm_two.user_id =three.id
confirm_two = iga_lasalle
confirm_two.save
>>>>>>> master

puts "Done!"

