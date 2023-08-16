document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 11 // 한 페이지에 보여줄 항목 개수
  const tableBody = document.querySelector(".order_table tbody")
  const paginationContainer = document.querySelector("#pagination-container")

  // 테이블의 전체 행 개수
  const totalItems = tableBody.querySelectorAll("tr.t_tr").length

  // 전체 페이지 개수 계산
  const totalPages = Math.ceil(totalItems / itemsPerPage)

  // 페이지네이션 버튼 생성 및 이벤트 핸들링
  for (let i = 1; i <= totalPages; i++) {
    const pageButton = document.createElement("button")
    pageButton.textContent = i

    const buttonContainer = document.createElement("div")
    buttonContainer.appendChild(pageButton)
    paginationContainer.style.margin = "35px auto 0 auto"
    paginationContainer.style.display = "flex"
    paginationContainer.style.justifyContent = "center"
    paginationContainer.style.alignItems = "center"

    pageButton.style.padding = "8px"
    pageButton.style.margin = "5px"
    pageButton.style.backgroundColor = "white"
    pageButton.style.borderRadius = "6px"
    pageButton.style.fontSize = "18px"
    pageButton.style.color = "black"
    pageButton.style.border = "1px solid gray"
    pageButton.style.boxShadow = "0 0 1px"
    pageButton.style.userSelect = "none"

    pageButton.addEventListener("click", function () {
      showPage(i)
    })
    paginationContainer.appendChild(buttonContainer)
  }

  // 페이지 초기화
  showPage(1)

  // 해당 페이지의 항목들만 보여주는 함수
  function showPage(pageNumber) {
    const startIndex = (pageNumber - 1) * itemsPerPage
    const endIndex = startIndex + itemsPerPage

    const rows = tableBody.querySelectorAll("tr.t_tr")
    for (let i = 0; i < rows.length; i++) {
      if (i >= startIndex && i < endIndex) {
        rows[i].style.display = "table-row"
        const firstCell = rows[i].querySelector("td:first-child")
        firstCell.style.marginTop = "10px"
      } else {
        rows[i].style.display = "none"
        const firstCell = rows[i].querySelector("td:first-child")
        firstCell.style.marginTop = "0"
      }
    }
  }
})