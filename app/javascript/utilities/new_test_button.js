document.addEventListener('turbolinks:load', function () {
  const newTestButton = document.querySelector('.new-test')
  if (newTestButton) {
    newTestButton.addEventListener('click', redirectToNewTest)
  }
})

function redirectToNewTest() {
  window.location.href = 'tests/new'
}
