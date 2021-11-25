# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Vitaly Kurennov', email: 'ViKur@somemail.com' }, { name: 'Yan Dupliy', email: 'yandupliy@gmail.com' }, { name: 'Ivan Ivanov', email: 'IvIv@somemail.com' },
                      { name: 'Petr Petrov', email: 'PePe@somemail.com' }])

categories = Category.create!([{ name: 'Backend' }, { name: 'Frontend' }, { name: 'Fullstack' }])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category_id: categories[0].id,
                         author_id: users[0].id },
                       { title: 'HTML', level: 1, category_id: categories[1].id,
                         author_id: users[0].id },
                       { title: 'CSS', level: 1, category_id: categories[1].id,
                         author_id: users[0].id },
                       { title: 'Introduction in Alien programming languages', level: 5,
                         category_id: categories[2].id, author_id: users[1].id }
                     ])

questions = Question.create!([
                               { body: 'Ruby question 1', test_id: tests[0].id },
                               { body: 'Ruby question 2', test_id: tests[0].id },
                               { body: 'Ruby question 3', test_id: tests[0].id },
                               { body: 'HTML question 1', test_id: tests[1].id },
                               { body: 'HTML question 2', test_id: tests[1].id },
                               { body: 'HTML question 3', test_id: tests[1].id },
                               { body: 'CSS question 1', test_id: tests[2].id },
                               { body: 'CSS question 2', test_id: tests[2].id },
                               { body: 'CSS question 3', test_id: tests[2].id },
                               { body: 'Alien question 1', test_id: tests[3].id },
                               { body: 'Alien question 2', test_id: tests[3].id },
                               { body: 'Alien question 3', test_id: tests[3].id }
                             ])

TestCompletion.create!([
                         { user_id: users[0].id, test_id: tests[3].id,
                           current_question_id: tests[3].questions.first.id },
                         { user_id: users[1].id, test_id: tests[0].id,
                           current_question_id: tests[0].questions.first.id },
                         { user_id: users[1].id, test_id: tests[1].id,
                           current_question_id: tests[1].questions.first.id },
                         { user_id: users[1].id, test_id: tests[2].id,
                           current_question_id: tests[2].questions.first.id },
                         { user_id: users[2].id, test_id: tests[1].id,
                           current_question_id: tests[1].questions.first.id },
                         { user_id: users[2].id, test_id: tests[2].id,
                           current_question_id: tests[2].questions.first.id },
                         { user_id: users[3].id, test_id: tests[1].id,
                           current_question_id: tests[1].questions.first.id },
                         { user_id: users[3].id, test_id: tests[3].id,
                           current_question_id: tests[3].questions.first.id }
                       ])

Answer.create!([
                 { body: 'Incorrect answer 1 for Ruby question 1', correct: false, question_id: questions[0].id },
                 { body: 'Incorrect answer 2 for Ruby question 1', correct: false, question_id: questions[0].id },
                 { body: 'Incorrect answer 3 for Ruby question 1', correct: false, question_id: questions[0].id },
                 { body: 'Correct answer 4 for Ruby question 1', correct: true, question_id: questions[0].id },
                 { body: 'Incorrect answer 1 for Ruby question 2', correct: false, question_id: questions[1].id },
                 { body: 'Incorrect answer 2 for Ruby question 2', correct: false, question_id: questions[1].id },
                 { body: 'Incorrect answer 3 for Ruby question 2', correct: false, question_id: questions[1].id },
                 { body: 'Correct answer 4 for Ruby question 2', correct: true, question_id: questions[1].id },
                 { body: 'Incorrect answer 1 for Ruby question 3', correct: false, question_id: questions[2].id },
                 { body: 'Incorrect answer 2 for Ruby question 3', correct: false, question_id: questions[2].id },
                 { body: 'Incorrect answer 3 for Ruby question 3', correct: false, question_id: questions[2].id },
                 { body: 'Correct answer 4 for Ruby question 3', correct: true, question_id: questions[2].id },
                 { body: 'Incorrect answer 1 for HTML question 1', correct: false, question_id: questions[3].id },
                 { body: 'Incorrect answer 2 for HTML question 1', correct: false, question_id: questions[3].id },
                 { body: 'Incorrect answer 3 for HTML question 1', correct: false, question_id: questions[3].id },
                 { body: 'Correct answer 4 for HTML question 1', correct: true, question_id: questions[3].id },
                 { body: 'Incorrect answer 1 for HTML question 2', correct: false, question_id: questions[4].id },
                 { body: 'Incorrect answer 2 for HTML question 2', correct: false, question_id: questions[4].id },
                 { body: 'Incorrect answer 3 for HTML question 2', correct: false, question_id: questions[4].id },
                 { body: 'Correct answer 4 for HTML question 2', correct: true, question_id: questions[4].id },
                 { body: 'Incorrect answer 1 for HTML question 3', correct: false, question_id: questions[5].id },
                 { body: 'Incorrect answer 2 for HTML question 3', correct: false, question_id: questions[5].id },
                 { body: 'Incorrect answer 3 for HTML question 3', correct: false, question_id: questions[5].id },
                 { body: 'Correct answer 4 for HTML question 3', correct: true, question_id: questions[5].id },
                 { body: 'Incorrect answer 1 for CSS question 1', correct: false, question_id: questions[6].id },
                 { body: 'Incorrect answer 2 for CSS question 1', correct: false, question_id: questions[6].id },
                 { body: 'Incorrect answer 3 for CSS question 1', correct: false, question_id: questions[6].id },
                 { body: 'Correct answer 4 for CSS question 1', correct: true, question_id: questions[6].id },
                 { body: 'Incorrect answer 1 for CSS question 2', correct: false, question_id: questions[7].id },
                 { body: 'Incorrect answer 2 for CSS question 2', correct: false, question_id: questions[7].id },
                 { body: 'Incorrect answer 3 for CSS question 2', correct: false, question_id: questions[7].id },
                 { body: 'Correct answer 4 for CSS question 2', correct: true, question_id: questions[7].id },
                 { body: 'Incorrect answer 1 for CSS question 3', correct: false, question_id: questions[8].id },
                 { body: 'Incorrect answer 2 for CSS question 3', correct: false, question_id: questions[8].id },
                 { body: 'Incorrect answer 3 for CSS question 3', correct: false, question_id: questions[8].id },
                 { body: 'Correct answer 4 for CSS question 3', correct: true, question_id: questions[8].id },
                 { body: 'Incorrect answer 1 for Alien question 1', correct: false, question_id: questions[9].id },
                 { body: 'Incorrect answer 2 for Alien question 1', correct: false, question_id: questions[9].id },
                 { body: 'Incorrect answer 3 for Alien question 1', correct: false, question_id: questions[9].id },
                 { body: 'Correct answer 4 for Alien question 1', correct: true, question_id: questions[9].id },
                 { body: 'Incorrect answer 1 for Alien question 2', correct: false, question_id: questions[10].id },
                 { body: 'Incorrect answer 2 for Alien question 2', correct: false, question_id: questions[10].id },
                 { body: 'Incorrect answer 3 for Alien question 2', correct: false, question_id: questions[10].id },
                 { body: 'Correct answer 4 for Alien question 2', correct: true, question_id: questions[10].id },
                 { body: 'Incorrect answer 1 for Alien question 3', correct: false, question_id: questions[11].id },
                 { body: 'Incorrect answer 2 for Alien question 3', correct: false, question_id: questions[11].id },
                 { body: 'Incorrect answer 3 for Alien question 3', correct: false, question_id: questions[11].id },
                 { body: 'Correct answer 4 for Alien question 3', correct: true, question_id: questions[11].id }
               ])
