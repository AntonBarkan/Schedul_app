# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(:name => 'MyName',
                    :password => '12345678',
                    :password_confirmation =>'12345678', :email => 'mail@mail.com',
                    :phone => '0547777777')

user.l_name = 'Lname'
user.position= 'full'
user.shabat= 'yes'
user.admin= 'yes'
user.save!
