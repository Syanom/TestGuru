document.addEventListener('turbolinks:load', function () {
  const items = document.querySelectorAll('.item')
  if (items.length > 0) {
    jumpButton(items)
    window.addEventListener('resize', jumpButton.bind(null, items))
  }
})

function jumpButton(items) {
  if (document.body.clientWidth < 365) {
    for (let item of items) { item.classList.remove('d-flex') }
  } else {
    for (let item of items) { item.classList.add('d-flex') }
  }
}
