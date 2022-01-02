document.addEventListener('turbolinks:load', function () {
  const controls = document.querySelectorAll('.form-inline-edit-link,.form-inline-cancel-link')

  if (controls.length) {
    const errors = document.querySelector('.resource-errors')
    if (errors) {
      const resourceId = errors.dataset.resourceId
      formInlineHandler(resourceId)
    }

    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineClickHandler)
    }
  }
})

function formInlineClickHandler(event) {
  event.preventDefault()

  const itemId = this.dataset.itemId
  console.log(itemId)
  formInlineHandler(itemId)
}

function formInlineHandler(itemId) {
  const editLink = document.querySelector('.form-inline-edit-link[data-item-id="' + itemId + '"')
  const cancelLink = document.querySelector('.form-inline-cancel-link[data-item-id="' + itemId + '"')
  const itemTitle = document.querySelector('.item-title[data-item-id="' + itemId + '"')
  const formInline = document.querySelector('.form-inline[data-item-id="' + itemId + '"')

  if (formInline.classList.contains('hide')) {
    itemTitle.classList.add('hide')
    formInline.classList.remove('hide')
    editLink.classList.add('hide')
    cancelLink.classList.remove('hide')
  } else {
    itemTitle.classList.remove('hide')
    formInline.classList.add('hide')
    editLink.classList.remove('hide')
    cancelLink.classList.add('hide')
  }
}
