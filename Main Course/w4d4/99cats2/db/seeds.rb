# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create(user_name: 'Tricks', password_digest: BCrypt::Password.create('Treat').to_s)
User.create(user_name: 'Trickss', password_digest: BCrypt::Password.create('Treat').to_s)
User.create(user_name: 'Tricksss', password_digest: BCrypt::Password.create('Treat').to_s)
Cat.create(birth_date: "12/12/1992",color: "black",name: "cat", sex:"F",user_id:1)
Cat.create(birth_date: "12/12/1992",color: "black",name: "cat", sex:"F",user_id:1)
Cat.create(birth_date: "12/12/1992",color: "black",name: "cat", sex:"F",user_id:1)
Cat.create(birth_date: "12/12/1992",color: "black",name: "cat", sex:"F",user_id:1)
CatRentalRequest.create(start_date:"12/12/1992",end_date: "12/12/2006",cat_id:1,status: "PENDING", user_id: 2 )
CatRentalRequest.create(start_date:"12/12/2005",end_date: "12/12/2012",cat_id:1,status: "PENDING", user_id: 2 )
CatRentalRequest.create(start_date:"12/12/2016",end_date: "12/12/2017",cat_id:1,status: "PENDING", user_id: 2 )
CatRentalRequest.create(start_date:"12/12/2017",end_date: "12/12/2018",cat_id:1,status: "PENDING", user_id: 2 )
Session.create(user_id:1)
Session.create(user_id:1)
