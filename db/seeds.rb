# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_answers(question, answers)
  3.times do |i|
    answers << Answer.create!(body: "Answer #{i + 1} for #{question.body}", correct: false, question_id: question.id)
  end
  answers << Answer.create!(body: "Correct answer 4 for #{question.body}", correct: true, question_id: question.id)
end

def create_questions(test, questions, answers)
  3.times do |i|
    question = Question.create!(body: "Question #{i + 1} for #{test.title} test", test_id: test.id)
    questions << question
    create_answers(question, answers)
  end
end

users = User.create!([{ name: 'Vitaly Kurennov' }, { name: 'Yan Dupliy' }, { name: 'Ivan Ivanov' },
                      { name: 'Petr Petrov' }])
categories = Category.create!([{ name: 'Backend' }, { name: 'Frontend' }, { name: 'Fullstack' }])
tests = Test.create!([
                       { title: 'Ruby', level: 2, category_id: Category.find_by(name: 'Backend').id,
                         author_id: User.find_by(name: 'Vitaly Kurennov').id },
                       { title: 'HTML', level: 1, category_id: Category.find_by(name: 'Frontend').id,
                         author_id: User.find_by(name: 'Vitaly Kurennov').id },
                       { title: 'CSS', level: 1, category_id: Category.find_by(name: 'Frontend').id,
                         author_id: User.find_by(name: 'Vitaly Kurennov').id },
                       { title: 'Introduction in Alien programming languages', level: 3,
                         category_id: Category.find_by(name: 'Fullstack').id, author_id: User.find_by(name: 'Yan Dupliy').id }
                     ])
questions = []
answers = []
tests.each do |test|
  create_questions(test, questions, answers)
end
