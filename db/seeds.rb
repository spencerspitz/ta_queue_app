# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Request.delete_all
Stack.delete_all
User.delete_all
rlist = []

rlist << Request.create!(name: "Jared Rosen", email: "jfrosen@colgate.edu", time_submitted: Time.now, desc: "What is a migration?", compsciclass: "COSC102", qtype: "Lab")
#
#slist = []
#
#slist << Stack.create!(user: "Cole", topic: "Recursion", coscclass: "102", comment: "Help!!!!!")

User.create!(:email => "amendelson@colgate.edu", :admin => true, :tutor => true)
User.create!(:email => "jfrosen@colgate.edu", :tutor => true)
