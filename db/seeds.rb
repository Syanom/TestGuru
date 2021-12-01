# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Passwords for all users 'Qwer1234'
users = User.create!([
                       { name: 'Vitaly Kurennov', email: 'ViKur@somemail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234' },
                       { name: 'Yan Dupliy', email: 'yandupliy@gmail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234' },
                       { name: 'Ivan Ivanov', email: 'IvIv@somemail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234' },
                       { name: 'Petr Petrov', email: 'PePe@somemail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234' }
                     ])

categories = Category.create!([{ name: 'Backend' }, { name: 'Frontend' }, { name: 'Fullstack' }])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category: categories[0],
                         author: users[0] },
                       { title: 'HTML', level: 1, category: categories[1],
                         author: users[0] },
                       { title: 'CSS', level: 1, category: categories[1],
                         author: users[0] },
                       { title: 'Introduction in Alien programming languages', level: 5,
                         category: categories[2], author: users[1] }
                     ])

questions = Question.create!([
                               { body: 'Ruby question 1', test: tests[0] },
                               { body: 'Ruby question 3', test: tests[0] },
                               { body: 'Ruby question 2', test: tests[0] },
                               { body: 'HTML question 1', test: tests[1] },
                               { body: 'HTML question 2', test: tests[1] },
                               { body: 'HTML question 3', test: tests[1] },
                               { body: 'CSS question 1', test: tests[2] },
                               { body: 'CSS question 2', test: tests[2] },
                               { body: 'CSS question 3', test: tests[2] },
                               { body: 'Alien question 1', test: tests[3] },
                               { body: 'Alien question 2', test: tests[3] },
                               { body: 'Alien question 3', test: tests[3] }
                             ])

TestCompletion.create!([
                         { user: users[0], test: tests[3],
                           current_question_id: tests[3].questions.first },
                         { user: users[1], test: tests[0],
                           current_question_id: tests[0].questions.first },
                         { user: users[1], test: tests[1],
                           current_question_id: tests[1].questions.first },
                         { user: users[1], test: tests[2],
                           current_question_id: tests[2].questions.first },
                         { user: users[2], test: tests[1],
                           current_question_id: tests[1].questions.first },
                         { user: users[2], test: tests[2],
                           current_question_id: tests[2].questions.first },
                         { user: users[3], test: tests[1],
                           current_question_id: tests[1].questions.first },
                         { user: users[3], test: tests[3],
                           current_question_id: tests[3].questions.first }
                       ])

Answer.create!([
                 { body: 'Incorrect answer 1 for Ruby question 1', correct: false, question: questions[0] },
                 { body: 'Incorrect answer 2 for Ruby question 1', correct: false, question: questions[0] },
                 { body: 'Incorrect answer 3 for Ruby question 1', correct: false, question: questions[0] },
                 { body: 'Correct answer 4 for Ruby question 1', correct: true, question: questions[0] },
                 { body: 'Incorrect answer 1 for Ruby question 2', correct: false, question: questions[1] },
                 { body: 'Incorrect answer 2 for Ruby question 2', correct: false, question: questions[1] },
                 { body: 'Incorrect answer 3 for Ruby question 2', correct: false, question: questions[1] },
                 { body: 'Correct answer 4 for Ruby question 2', correct: true, question: questions[1] },
                 { body: 'Incorrect answer 1 for Ruby question 3', correct: false, question: questions[2] },
                 { body: 'Incorrect answer 2 for Ruby question 3', correct: false, question: questions[2] },
                 { body: 'Incorrect answer 3 for Ruby question 3', correct: false, question: questions[2] },
                 { body: 'Correct answer 4 for Ruby question 3', correct: true, question: questions[2] },
                 { body: 'Incorrect answer 1 for HTML question 1', correct: false, question: questions[3] },
                 { body: 'Incorrect answer 2 for HTML question 1', correct: false, question: questions[3] },
                 { body: 'Incorrect answer 3 for HTML question 1', correct: false, question: questions[3] },
                 { body: 'Correct answer 4 for HTML question 1', correct: true, question: questions[3] },
                 { body: 'Incorrect answer 1 for HTML question 2', correct: false, question: questions[4] },
                 { body: 'Incorrect answer 2 for HTML question 2', correct: false, question: questions[4] },
                 { body: 'Incorrect answer 3 for HTML question 2', correct: false, question: questions[4] },
                 { body: 'Correct answer 4 for HTML question 2', correct: true, question: questions[4] },
                 { body: 'Incorrect answer 1 for HTML question 3', correct: false, question: questions[5] },
                 { body: 'Incorrect answer 2 for HTML question 3', correct: false, question: questions[5] },
                 { body: 'Incorrect answer 3 for HTML question 3', correct: false, question: questions[5] },
                 { body: 'Correct answer 4 for HTML question 3', correct: true, question: questions[5] },
                 { body: 'Incorrect answer 1 for CSS question 1', correct: false, question: questions[6] },
                 { body: 'Incorrect answer 2 for CSS question 1', correct: false, question: questions[6] },
                 { body: 'Incorrect answer 3 for CSS question 1', correct: false, question: questions[6] },
                 { body: 'Correct answer 4 for CSS question 1', correct: true, question: questions[6] },
                 { body: 'Incorrect answer 1 for CSS question 2', correct: false, question: questions[7] },
                 { body: 'Incorrect answer 2 for CSS question 2', correct: false, question: questions[7] },
                 { body: 'Incorrect answer 3 for CSS question 2', correct: false, question: questions[7] },
                 { body: 'Correct answer 4 for CSS question 2', correct: true, question: questions[7] },
                 { body: 'Incorrect answer 1 for CSS question 3', correct: false, question: questions[8] },
                 { body: 'Incorrect answer 2 for CSS question 3', correct: false, question: questions[8] },
                 { body: 'Incorrect answer 3 for CSS question 3', correct: false, question: questions[8] },
                 { body: 'Correct answer 4 for CSS question 3', correct: true, question: questions[8] },
                 { body: 'Incorrect answer 1 for Alien question 1', correct: false, question: questions[9] },
                 { body: 'Incorrect answer 2 for Alien question 1', correct: false, question: questions[9] },
                 { body: 'Incorrect answer 3 for Alien question 1', correct: false, question: questions[9] },
                 { body: 'Correct answer 4 for Alien question 1', correct: true, question: questions[9] },
                 { body: 'Incorrect answer 1 for Alien question 2', correct: false, question: questions[10] },
                 { body: 'Incorrect answer 2 for Alien question 2', correct: false, question: questions[10] },
                 { body: 'Incorrect answer 3 for Alien question 2', correct: false, question: questions[10] },
                 { body: 'Correct answer 4 for Alien question 2', correct: true, question: questions[10] },
                 { body: 'Incorrect answer 1 for Alien question 3', correct: false, question: questions[11] },
                 { body: 'Incorrect answer 2 for Alien question 3', correct: false, question: questions[11] },
                 { body: 'Incorrect answer 3 for Alien question 3', correct: false, question: questions[11] },
                 { body: 'Correct answer 4 for Alien question 3', correct: true, question: questions[11] }
               ])
