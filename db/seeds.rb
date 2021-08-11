puts "Deleting database.."
Confirmation.destroy_all
Store.destroy_all
User.destroy_all

puts "Creating Users.."

def create_user(name)
  user = User.create!(fname: name, lname: "last", username: name, email: "#{name}@email.com", password: "123", type: Customer)
  puts "Created user #{name}"
  return user
end

puts "Creating Customers.."
bruce = create_user('bruce')

10.times do |name|
  create_user("name#{name}")
end

puts "Creating Businesses.."

saq = User.create!(fname: "john", lname: "doe", username: "saq", email: "saq@email.com", password: "123", type: BusinessUser)
sqdc = User.create!(fname: "jane", lname: "doe", username: "sqdc", email: "sqdc@email.com", password: "123", type: BusinessUser)
iga = User.create!(fname: "jj", lname: "doe", username: "iga", email: "iga@email.com", password: "123", type: BusinessUser)
chez_krystina = User.create!(fname: "krystina", lname: "wagon", username: "chez_krystina", email: "chez_krystina@email.com", password: "123", type: BusinessUser)
saq.save!

puts "Creating Stores.."

def create_store(name, address, user)
  store = Store.new(name: name, address: address, capacity: "10", message: "You are now one step closer to getting in your favorite store. Please remember to wash your hands and to always wear a mask. Thank you for using NotifiQ!")
  store.user = user
  store.save!
  puts "Created store #{store.name}"
  return store
end

saq_express = create_store("SAQ Express", "954 Decarie montreal quebec", saq)

['Costco', 'McDonalds', 'IKEA', 'Nike'].each do |name|
  create_store(name, "123 LaSalle montreal quebec", iga)
end

sqdc_berri = create_store( "SQDC Berri", "123 Berri montreal quebec", sqdc)

chez_krystina = create_store("Dépanneur chez Krystina", "5333 Avenue Casgrain Suite 102, Montréal, QC H2T 1X3", chez_krystina)

iga_lasalle = create_store("IGA LaSalle", "123 LaSalle montreal quebec", iga)


puts "Creating Confirmations.."

def create_confirmation(store, position_number, user)
  now = Time.now
  expected_visit_time = now.to_i + (position_number * 60 + 10)
  confirmation = Confirmation.create!(start_time: now, end_time: now + 1.hour, position: position_number, store: store, user: user, expected_visit_time: expected_visit_time)
  confirmation.update_attribute :created_at, (10).days.ago
  confirmation.save!
  puts "#{user.fname} is in position #{position_number} in line "
  return confirmation
end

def create_queue(store, quantity)
  customers = User.customers.reject{|customer| customer.fname == 'bruce'}
  puts "Creating queue for #{store.name}"
  quantity.times do |number|
    user = customers.sample
    create_confirmation(store, number, user)
  end
end

create_queue(saq_express, 10)
create_queue(sqdc_berri, 60)

puts "Done!"

