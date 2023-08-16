document.addEventListener('DOMContentLoaded', function () {
  const itemsPerPage = 10
  const tableBody = document.querySelector('.basket_table tbody')
  const paginationContainer = document.querySelector('#pagination-container')

  const totalItems = tableBody.querySelectorAll('tr').length

  const totalPages = Math.ceil(totalItems / itemsPerPage)

  for (let i = 1; i <= totalPages; i++) {
    const basketButton = document.createElement('button')
    basketButton.textContent = i

    const buttonContainer = document.createElement('div')
    buttonContainer.appendChild(basketButton)
    paginationContainer.style.border = '1px solid black'
    paginationContainer.style.display = 'flex'
    paginationContainer.style.justifyContent = 'center'
    paginationContainer.style.alignItems = 'center'
    paginationContainer.style.margin = '15px auto 0 auto'

    basketButton.style.padding = '8px'
    basketButton.style.margin = '5px'
    basketButton.style.backgroundColor = 'black'
    basketButton.style.borderRadius = '6px'
    basketButton.style.fontSize = '18px'
    basketButton.style.color = 'white'

    basketButton.addEventListener('click', function () {
      showPage(i)
    })
    paginationContainer.append(buttonContainer)
  }

  showPage(1)

  function showPage(pageNumber) {
    const startIndex = (pageNumber - 1) * itemsPerPage
    const endIndex = startIndex + itemsPerPage

    const rows = tableBody.querySelector('tr')
    for (let i = 0; i < rows.length; i++) {
      if (i >= startIndex && i < endIndex) {
        rows[i].style.display = 'table-row'
      } else {
        rows[i].style.display = 'none'
      }
    }
  }
})
