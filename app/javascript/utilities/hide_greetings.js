document.addEventListener('turbolinks:load', function () {
  window.addEventListener('resize', handleGreetings)
})

function handleGreetings() {
  const greetings = document.querySelector('.greetings')
  if (document.body.clientWidth < 440) {
    greetings.classList.add('hide')
    console.log(document.querySelector('.greetings'))
  } else {
    greetings.classList.remove('hide')
  }
}
