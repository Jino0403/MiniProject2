/*카테고리 페이지 페이지네이션 구현*/

document.addEventListener('DOMContentLoaded', function () {
  const itemsPerPage = 10
  const itemsContainer = document.querySelector('.item_line')
  const allItems = itemsContainer.querySelectorAll('.items')
  const totalItems = allItems.length
  const totalPages = Math.ceil(totalItems / itemsPerPage)

  const pageButtonsContainer = document.createElement('div')
  pageButtonsContainer.id = 'page-buttons'
  pageButtonsContainer.style.textAlign = 'center'
  pageButtonsContainer.style.margin = '20px 0'
  itemsContainer.after(pageButtonsContainer) // itemsContainer 다음에 추가

  let currentPage = 1

  function updateItemsDisplay() {
    const startIndex = (currentPage - 1) * itemsPerPage
    const endIndex = Math.min(startIndex + itemsPerPage, totalItems)

    allItems.forEach((item, index) => {
      if (index >= startIndex && index < endIndex) {
        item.style.display = 'block'
      } else {
        item.style.display = 'none'
      }
    })
  }

  function updatePageButtons() {
    pageButtonsContainer.innerHTML = ''

    const maxVisibleButtons = 5
    const start = Math.max(1, currentPage - Math.floor(maxVisibleButtons / 2))
    const end = Math.min(totalPages, start + maxVisibleButtons - 1)

    const firstButton = document.createElement('button')
    firstButton.textContent = '≪'
    firstButton.style.fontSize = '25px'
    firstButton.style.border = '1px solid transparent'
    firstButton.style.backgroundColor = 'white'
    firstButton.style.margin = '0 5px'
    firstButton.addEventListener('click', () => goToPage(1))
    firstButton.addEventListener('mouseover', () => {
      firstButton.style.fontWeight = '600'
    })
    firstButton.addEventListener('mouseout', () => {
      firstButton.style.fontWeight = ''
    })
    pageButtonsContainer.appendChild(firstButton)

    const prevButton = document.createElement('button')
    prevButton.textContent = '<'
    prevButton.style.fontSize = '25px'
    prevButton.style.border = '1px solid transparent'
    prevButton.style.backgroundColor = 'white'
    prevButton.style.margin = '0 5px'
    prevButton.addEventListener('click', () => goToPage(currentPage - 1))
    prevButton.addEventListener('mouseover', () => {
      prevButton.style.fontWeight = '600'
    })
    prevButton.addEventListener('mouseout', () => {
      prevButton.style.fontWeight = ''
    })
    pageButtonsContainer.appendChild(prevButton)

    for (let page = start; page <= end; page++) {
      const button = document.createElement('button')
      button.textContent = page
      button.style.fontSize = '25px'
      button.style.border = '1px solid transparent'
      button.style.borderRadius = '6px'
      button.style.backgroundColor = page === currentPage ? 'black' : 'white'
      button.style.margin = '0 5px'
      button.style.color = page === currentPage ? 'white' : 'black'
      button.addEventListener('click', () => goToPage(page))
      button.addEventListener('mouseover', () => {
        button.style.backgroundColor = 'black'
        button.style.borderRadius = '6px'
        button.style.color = 'white'
      })
      button.addEventListener('mouseout', () => {
        button.style.backgroundColor =
          page === currentPage ? 'black' : 'white'
        button.style.color = page === currentPage ? 'white' : 'black'
      })
      pageButtonsContainer.appendChild(button)
    }

    const nextButton = document.createElement('button')
    nextButton.textContent = '>'
    nextButton.style.fontSize = '25px'
    nextButton.style.border = '1px solid transparent'
    nextButton.style.backgroundColor = 'white'
    nextButton.style.margin = '0 5px'
    nextButton.addEventListener('click', () => goToPage(currentPage + 1))
    nextButton.addEventListener('mouseover', () => {
      nextButton.style.fontWeight = '600'
    })
    nextButton.addEventListener('mouseout', () => {
      nextButton.style.fontWeight = ''
    })
    pageButtonsContainer.appendChild(nextButton)

    const lastButton = document.createElement('button')
    lastButton.textContent = '≫'
    lastButton.style.fontSize = '25px'
    lastButton.style.border = '1px solid transparent'
    lastButton.style.backgroundColor = 'white'
    lastButton.style.margin = '0 5px'
    lastButton.addEventListener('click', () => goToPage(totalPages))
    lastButton.addEventListener('mouseover', () => {
      lastButton.style.fontWeight = '600'
    })
    lastButton.addEventListener('mouseout', () => {
      lastButton.style.fontWeight = ''
    })
    pageButtonsContainer.appendChild(lastButton)
  }

  function goToPage(page) {
    currentPage = Math.max(1, Math.min(page, totalPages))
    updateItemsDisplay()
    updatePageButtons()
  }

  updateItemsDisplay()
  updatePageButtons()
})
