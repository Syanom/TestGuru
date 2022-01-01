document.addEventListener('turbolinks:load', function () {
  const control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const testsContainer = document.querySelector('.tests')
  const testsContainerClasses = testsContainer.classList

  // Nodelist
  const testsArray = testsContainer.querySelectorAll('.test')
  const sortedTestsArray = []

  for (let i = 0; i < testsArray.length; i++) {
    sortedTestsArray.push(testsArray[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedTestsArray.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedTestsArray.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  const sortedTestsContainer = document.createElement('div')
  sortedTestsContainer.classList = testsContainerClasses

  for (let i = 0; i < sortedTestsArray.length; i++) {
    sortedTestsContainer.appendChild(sortedTestsArray[i])
  }

  testsContainer.parentNode.replaceChild(sortedTestsContainer, testsContainer)
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('.test-title').textContent
  const testTitle2 = row2.querySelector('.test-title').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('.test-title').textContent
  const testTitle2 = row2.querySelector('.test-title').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
