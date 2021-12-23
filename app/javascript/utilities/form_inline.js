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

  const testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  const editLink = document.querySelector('.form-inline-edit-link[data-test-id="' + testId + '"')
  const cancelLink = document.querySelector('.form-inline-cancel-link[data-test-id="' + testId + '"')
  const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"')
  const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"')

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    editLink.classList.add('hide')
    cancelLink.classList.remove('hide')
  } else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    editLink.classList.remove('hide')
    cancelLink.classList.add('hide')
  }
}
