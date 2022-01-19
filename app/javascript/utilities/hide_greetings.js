document.addEventListener('turbolinks:load', function () {
  const greetings = document.querySelector('.greetings')
  if (greetings) {
    handleGreetings(greetings)
    window.addEventListener('resize', handleGreetings.bind(null, greetings))
  }
})

function handleGreetings(greetings) {
  if (document.body.clientWidth < 440) {
    greetings.classList.add('hide')
  } else {
    greetings.classList.remove('hide')
  }
}
