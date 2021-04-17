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
bruce = create_user('Bruce')

10.times do |name|
  create_user("name#{name}")
end

puts "Creating Businesses.."

saq = User.create!(fname: "john", lname: "doe", username: "saq", email: "saq@email.com", password: "123", type: BusinessUser)
sqdc = User.create!(fname: "jane", lname: "doe", username: "sqdc", email: "sqdc@email.com", password: "123", type: BusinessUser)
iga = User.create!(fname: "jj", lname: "doe", username: "iga", email: "iga@email.com", password: "123", type: BusinessUser)
saq.save!

puts "Creating Stores.."

def create_store(name, address, user)
  store = Store.new(name: name, address: address, capacity: "10")
  store.user = user
  store.save!
  puts "Created store #{store.name}"
  return store
end

saq_express = create_store("SAQ Express", "954 Decarie montreal quebec", saq)

sqdc_berri = create_store( "SQDC Berri", "123 Berri montreal quebec", sqdc)

iga_lasalle = create_store("IGA LaSalle", "123 LaSalle montreal quebec", iga)

['Costco', 'McDonalds', 'IKEA', 'Nike'].each do |name|
  create_store(name, "123 LaSalle montreal quebec", iga)
end


puts "Creating Confirmations.."

def create_confirmation(store, position_number, user)
  now = Time.now
  confirmation = Confirmation.create!(start_time: now, end_time: now + 1.hour, position: position_number, store: store, user: user)
  confirmation.update_attribute :created_at, (10).days.ago
  confirmation.save!
  puts "#{user.fname} is in position #{position_number} in line "
  return confirmation
end

def create_queue(store, quantity)
  customers = User.customers.reject{|customer| customer.fname == 'Bruce'}
  puts "Creating queue for #{store.name}"
  quantity.times do |number|
    user = customers.sample
    create_confirmation(store, number, user)
  end
end

create_queue(saq_express, 10)
create_queue(sqdc_berri, 60)

puts "Done!"

