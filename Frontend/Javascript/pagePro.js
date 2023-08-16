document.addEventListener('DOMContentLoaded', function () {
  const itemsPerPage = 5 // Number of items to show per page
  const totalItems = document.querySelectorAll('.t_tr').length // Total number of items

  const totalPages = Math.ceil(totalItems / itemsPerPage) // Calculate total number of pages

  const paginationContainer = document.getElementById('pagination-container')

  for (let page = 1; page <= totalPages; page++) {
    const button = document.createElement('button')
    button.textContent = page
    button.addEventListener('click', () => showPage(page))
    paginationContainer.appendChild(button)
    paginationContainer.style.margin = '35px auto 0 auto'
    paginationContainer.style.display = 'flex'
    paginationContainer.style.justifyContent = 'center'
    paginationContainer.style.alignItems = 'center'

    button.style.padding = '8px'
    button.style.margin = '5px'
    button.style.backgroundColor = 'white'
    button.style.borderRadius = '6px'
    button.style.fontSize = '18px'
    button.style.color = 'black'
    button.style.border = '1px solid gray'

    button.style.boxShadow = '0 0 1px'
  }

  function showPage(pageNumber) {
    const items = document.querySelectorAll('.t_tr')

    items.forEach((item, index) => {
      if (
        index >= (pageNumber - 1) * itemsPerPage &&
        index < pageNumber * itemsPerPage
      ) {
        item.style.display = 'table-row'
      } else {
        item.style.display = 'none'
      }
    })
  }

  // Show the first page initially
  showPage(1)
})
