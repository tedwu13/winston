# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
questions = Question.create(
    [
        { question_text: "What is the preferred size of your college?" },
        { question_text: "East coast or West coast?" },
        { question_text: "What majors are you interested in?" },
        { question_text: "What are your extracurricular activities?" },
        { question_text: "What are some college that you are interested in?" },
    ]
)