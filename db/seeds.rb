# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Vitaly Kurennov' }, { name: 'Yan Dupliy' }, { name: 'Ivan Ivanov' },
                      { name: 'Petr Petrov' }])

categories = Category.create!([{ name: 'Backend' }, { name: 'Frontend' }, { name: 'Fullstack' }])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category_id: categories[0],
                         author_id: users[0] },
                       { title: 'HTML', level: 1, category_id: categories[1],
                         author_id: users[0] },
                       { title: 'CSS', level: 1, category_id: categories[1],
                         author_id: users[0] },
                       { title: 'Introduction in Alien programming languages', level: 3,
                         category_id: categories[2], author_id: users[1] }
                     ])

TestCompletion.create!([
                         { user_id: users[0], test_id: tests[3] },
                         { user_id: users[1], test_id: tests[0] },
                         { user_id: users[1], test_id: tests[1] },
                         { user_id: users[1], test_id: tests[2] },
                         { user_id: users[2], test_id: tests[1] },
                         { user_id: users[2], test_id: tests[2] },
                         { user_id: users[3], test_id: tests[1] },
                         { user_id: users[3], test_id: tests[3] }
                       ])

questions = Question.create!([
                               { body: 'Ruby question 1', test_id: tests[0] },
                               { body: 'Ruby question 2', test_id: tests[0] },
                               { body: 'Ruby question 3', test_id: tests[0] },
                               { body: 'HTML question 1', test_id: tests[1] },
                               { body: 'HTML question 2', test_id: tests[1] },
                               { body: 'HTML question 3', test_id: tests[1] },
                               { body: 'CSS question 1', test_id: tests[2] },
                               { body: 'CSS question 2', test_id: tests[2] },
                               { body: 'CSS question 3', test_id: tests[2] },
                               { body: 'Alien question 1', test_id: tests[3] },
                               { body: 'Alien question 2', test_id: tests[3] },
                               { body: 'Alien question 3', test_id: tests[3] }
                             ])

Answer.create!([
                 { body: 'Incorrect answer 1 for Ruby question 1', correct: false, question_id: questions[0] },
                 { body: 'Incorrect answer 2 for Ruby question 1', correct: false, question_id: questions[0] },
                 { body: 'Incorrect answer 3 for Ruby question 1', correct: false, question_id: questions[0] },
                 { body: 'Correct answer 4 for Ruby question 1', correct: true, question_id: questions[0] },
                 { body: 'Incorrect answer 1 for Ruby question 2', correct: false, question_id: questions[1] },
                 { body: 'Incorrect answer 2 for Ruby question 2', correct: false, question_id: questions[1] },
                 { body: 'Incorrect answer 3 for Ruby question 2', correct: false, question_id: questions[1] },
                 { body: 'Correct answer 4 for Ruby question 2', correct: true, question_id: questions[1] },
                 { body: 'Incorrect answer 1 for Ruby question 3', correct: false, question_id: questions[2] },
                 { body: 'Incorrect answer 2 for Ruby question 3', correct: false, question_id: questions[2] },
                 { body: 'Incorrect answer 3 for Ruby question 3', correct: false, question_id: questions[2] },
                 { body: 'Correct answer 4 for Ruby question 3', correct: true, question_id: questions[2] },
                 { body: 'Incorrect answer 1 for HTML question 1', correct: false, question_id: questions[3] },
                 { body: 'Incorrect answer 2 for HTML question 1', correct: false, question_id: questions[3] },
                 { body: 'Incorrect answer 3 for HTML question 1', correct: false, question_id: questions[3] },
                 { body: 'Correct answer 4 for HTML question 1', correct: true, question_id: questions[3] },
                 { body: 'Incorrect answer 1 for HTML question 2', correct: false, question_id: questions[4] },
                 { body: 'Incorrect answer 2 for HTML question 2', correct: false, question_id: questions[4] },
                 { body: 'Incorrect answer 3 for HTML question 2', correct: false, question_id: questions[4] },
                 { body: 'Correct answer 4 for HTML question 2', correct: true, question_id: questions[4] },
                 { body: 'Incorrect answer 1 for HTML question 3', correct: false, question_id: questions[5] },
                 { body: 'Incorrect answer 2 for HTML question 3', correct: false, question_id: questions[5] },
                 { body: 'Incorrect answer 3 for HTML question 3', correct: false, question_id: questions[5] },
                 { body: 'Correct answer 4 for HTML question 3', correct: true, question_id: questions[5] },
                 { body: 'Incorrect answer 1 for CSS question 1', correct: false, question_id: questions[6] },
                 { body: 'Incorrect answer 2 for CSS question 1', correct: false, question_id: questions[6] },
                 { body: 'Incorrect answer 3 for CSS question 1', correct: false, question_id: questions[6] },
                 { body: 'Correct answer 4 for CSS question 1', correct: true, question_id: questions[6] },
                 { body: 'Incorrect answer 1 for CSS question 2', correct: false, question_id: questions[7] },
                 { body: 'Incorrect answer 2 for CSS question 2', correct: false, question_id: questions[7] },
                 { body: 'Incorrect answer 3 for CSS question 2', correct: false, question_id: questions[7] },
                 { body: 'Correct answer 4 for CSS question 2', correct: true, question_id: questions[7] },
                 { body: 'Incorrect answer 1 for CSS question 3', correct: false, question_id: questions[8] },
                 { body: 'Incorrect answer 2 for CSS question 3', correct: false, question_id: questions[8] },
                 { body: 'Incorrect answer 3 for CSS question 3', correct: false, question_id: questions[8] },
                 { body: 'Correct answer 4 for CSS question 3', correct: true, question_id: questions[8] },
                 { body: 'Incorrect answer 1 for Alien question 1', correct: false, question_id: questions[9] },
                 { body: 'Incorrect answer 2 for Alien question 1', correct: false, question_id: questions[9] },
                 { body: 'Incorrect answer 3 for Alien question 1', correct: false, question_id: questions[9] },
                 { body: 'Correct answer 4 for Alien question 1', correct: true, question_id: questions[9] },
                 { body: 'Incorrect answer 1 for Alien question 2', correct: false, question_id: questions[10] },
                 { body: 'Incorrect answer 2 for Alien question 2', correct: false, question_id: questions[10] },
                 { body: 'Incorrect answer 3 for Alien question 2', correct: false, question_id: questions[10] },
                 { body: 'Correct answer 4 for Alien question 2', correct: true, question_id: questions[10] },
                 { body: 'Incorrect answer 1 for Alien question 3', correct: false, question_id: questions[11] },
                 { body: 'Incorrect answer 2 for Alien question 3', correct: false, question_id: questions[11] },
                 { body: 'Incorrect answer 3 for Alien question 3', correct: false, question_id: questions[11] },
                 { body: 'Correct answer 4 for Alien question 3', correct: true, question_id: questions[11] }
               ])
