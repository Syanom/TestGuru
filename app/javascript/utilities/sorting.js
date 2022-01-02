document.addEventListener('turbolinks:load', function () {
  const control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  const itemsContainer = document.querySelector('.items')
  const itemsContainerClasses = itemsContainer.classList

  // Nodelist
  const itemsArray = itemsContainer.querySelectorAll('.item')
  const sortedItemsArray = []

  for (let i = 0; i < itemsArray.length; i++) {
    sortedItemsArray.push(itemsArray[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedItemsArray.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedItemsArray.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  const newItemButton = document.querySelector('.new-item')
  if (newItemButton) {
    sortedItemsArray.unshift(newItemButton)
  }

  const sortedItemsContainer = document.createElement('div')
  sortedItemsContainer.classList = itemsContainerClasses

  for (let i = 0; i < sortedItemsArray.length; i++) {
    sortedItemsContainer.appendChild(sortedItemsArray[i])
  }

  itemsContainer.parentNode.replaceChild(sortedItemsContainer, itemsContainer)
}

function compareRowsAsc(item1, item2) {
  const itemTitle1 = item1.querySelector('.item-title').textContent
  const itemTitle2 = item2.querySelector('.item-title').textContent

  if (itemTitle1 < itemTitle2) { return -1 }
  if (itemTitle1 > itemTitle2) { return 1 }
  return 0
}

function compareRowsDesc(item1, item2) {
  const itemTitle1 = item1.querySelector('.item-title').textContent
  const itemTitle2 = item2.querySelector('.item-title').textContent

  if (itemTitle1 < itemTitle2) { return 1 }
  if (itemTitle1 > itemTitle2) { return -1 }
  return 0
}
