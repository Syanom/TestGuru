users = User.create!([
                       { first_name: 'Yan', last_name: 'Dupliy', email: 'yandupliy@gmail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234', type: 'Admin' },
                       { first_name: 'Vitaly', last_name: 'Kurennov', email: 'ViKur@somemail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234', type: 'Admin' },
                       { first_name: 'Ivan', last_name: 'Ivanov', email: 'IvIv@somemail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234' },
                       { first_name: 'Petr', last_name: 'Petrov', email: 'PePe@somemail.com',
                         confirmed_at: '2021-12-1 22:00:00', updated_at: '2021-12-1 22:00:00',
                         password: 'Qwer1234' }
                     ])

categories = Category.create!([{ name: 'Backend' }, { name: 'Frontend' }, { name: 'Fullstack' }])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category: categories[0],
                         author: users[0] },
                       { title: 'HTML', level: 1, category: categories[1],
                         author: users[0], timer: '00:10:00' },
                       { title: 'CSS', level: 1, category: categories[1],
                         author: users[0], timer: '00:00:10' },
                       { title: 'Introduction in Alien programming languages', level: 5,
                         category: categories[2], author: users[1], timer: '01:00:00' }
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

Badge.create!([
                { name: 'First try Ruby', image_url: 'image', test: tests[0], attempts: 1 },
                { name: 'Frontend in 3 attempts', image_url: 'image', category: categories[1], attempts: 3 },
                { name: 'Frontend in 30 seconds', image_url: 'image', category: categories[1],
                  completion_time: '00:00:30' },
                { name: 'Frontend completed', image_url: 'image', category: categories[1], completion: true },
                { name: 'Alien programming in hour', image_url: 'image', test: tests[3],
                  completion_time: '01:00:00' }
              ])
