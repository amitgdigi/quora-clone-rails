# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(email:"user1@gmail.com", user_id: 1)

# 5.times do |n|
#     User.create!(email: "user1#{n+1}@gmail.com", name:"name#{n+1}", password:"asdasd", password_confirmation:"asdasd")
# end

5.times do |n|
    Question.create!(question: "question number#{n}", user_id:"2")
    puts n
end

5.times do |n|
    Answer.create!(answer: "answer#{n+1}", question_id:n+1)
end