document.addEventListener('turbolinks:load', function () {
  handleGreetings()
  window.addEventListener('resize', handleGreetings)
})

function handleGreetings() {
  const greetings = document.querySelector('.greetings')
  if (document.body.clientWidth < 440) {
    greetings.classList.add('hide')
  } else {
    greetings.classList.remove('hide')
  }
}
