
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

saq_villeray = Store.new(name: "Saq Villeray", address: "123 Villeray", capacity: "10")
saq_villeray.user = saq
saq_villeray.save!

sqdc_berri = Store.new(name: "SQDC Berri", address: "123 Berri", capacity: "10")
sqdc_berri.user = sqdc
sqdc_berri.save

iga_lasalle = Store.new(name: "IGA LaSalle", address: "123 LaSalle", capacity: "10")
iga_lasalle.user = iga
iga_lasalle.save

puts "Creating Confirmations.."

tep = Confirmation.new(start_time: Time.now)
tep.user_id = one.id
tep.store = saq_villeray
tep.save!

puts "Done!"
