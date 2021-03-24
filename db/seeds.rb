User.destroy_all
Store.destroy_all

u = BusinessUser.create!(email: 'a@a.a', password: '123456')

s = Store.new(name: 'test')
s.user = u
s.save!

