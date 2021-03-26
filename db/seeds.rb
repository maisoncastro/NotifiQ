
puts "Deleting database.."
User.destroy_all
Store.destroy_all

puts "Creating Users.."

one = User.create!(fname: "one", lname: "last", email: "one@email.com", password: "123456", type: "Customer")

puts "Creating Business.."
u = BusinessUser.create!(email: 'a@a.a', password: '123456')

puts "Creating Store.."
s = Store.new(name: 'test')
s.user = u
s.save!

puts "Done!"
