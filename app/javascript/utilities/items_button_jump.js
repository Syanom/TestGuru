document.addEventListener('turbolinks:load', function () {
  const items = document.querySelectorAll('.item')
  if (items.length > 0) {
    jumpButton()
    window.addEventListener('resize', jumpButton)
  }
})

function jumpButton() {
  const items = document.querySelectorAll('.item')
  if (document.body.clientWidth < 365) {
    for (let test of items) { test.classList.remove('d-flex') }
  } else {
    for (let test of items) { test.classList.add('d-flex') }
  }
}
