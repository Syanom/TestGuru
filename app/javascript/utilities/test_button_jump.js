document.addEventListener('turbolinks:load', function () {
  const tests = document.querySelectorAll('.test')
  if (tests.length > 0) {
    jumpButton()
    window.addEventListener('resize', jumpButton)
  }
})

function jumpButton() {
  const tests = document.querySelectorAll('.test')
  if (document.body.clientWidth < 365) {
    for (let test of tests) { test.classList.remove('d-flex') }
  } else {
    for (let test of tests) { test.classList.add('d-flex') }
  }
}
