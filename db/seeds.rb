# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create(
  [
    { id: 1, question_text: 'What type of university are you interested in attending?' },
    { id: 2, question_text: 'Which US region(s) would you like your future university to be located in?' },
    { id: 3, question_text: 'What US College Rankings tier would you like your future university to be in?' },
    { id: 4, question_text: 'What level of student body diversity are you looking for at your future university?' },
    { id: 5, question_text: 'What is your ideal major of study?' }
  ]
)