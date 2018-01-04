# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cat.destroy_all
CatRentalRequest.destroy_all

# Cat.create!([
#   { name: 'Star Wars', birth_date: '2015/01/20', color: 'orange', sex: 'M', description: 'The friendliest cat!'},
#   { name: 'Albert', birth_date: '2016/03/10', color: 'black', sex: 'M', description: 'The coolest cat!'},
#   { name: 'Empress', birth_date: '2014/05/23', color: 'white', sex: 'F', description: 'The hottest cat!'},
#   ])

CatRentalRequest.create!([
  { cat_id: 1, start_date: '2018/01/20', end_date: '2018/01/21',  status: 'PENDING'},
  { cat_id: 4, start_date: '2018/01/10', end_date: '2018/01/24',  status: 'APPROVED'},
  { cat_id: 3, start_date: '2018/02/11', end_date: '2019/04/04',  status: 'DENIED'}
  ])
