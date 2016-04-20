# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


teachers = ["Derek",
"Hunter",
"Jaclyn",
"Julian",
"Mihai",
"Sarah",
"Seba",
"Shambhavi",
"Walker"]


teachers.each do |name|
 teacher =  Teacher.create(name: name)

  5.times do
    Badge.create({
      votes: rand(11),
      teacher_id: teacher.id,
      title: Faker::Hacker.say_something_smart
      })

  end
end


