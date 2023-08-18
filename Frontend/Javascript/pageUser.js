// document.addEventListener("DOMContentLoaded", function () {
//   const itemsPerPage = 8
//   const tableBody = document.querySelector(".user_table tbody")
//   const paginationContainer = document.querySelector("#pagination-container")

//   const totalItems = tableBody.querySelectorAll("tr.t_tr").length

//   const totalPages = Math.ceil(totalItems / itemsPerPage)

//   for (let i = 1; i <= totalPages; i++) {
//     const userButton = document.createElement("button")
//     userButton.textContent = i
//     userButton.addEventListener("click", () => showPage(i))
//     paginationContainer.appendChild(userButton)
//     paginationContainer.style.margin = "40px auto 0 auto"
//     paginationContainer.style.display = "flex"
//     paginationContainer.style.justifyContent = "center"
//     paginationContainer.style.alignItems = "center"

//     userButton.style.padding = "8px"
//     userButton.style.margin = "5px"
//     userButton.style.border = "1px solid gray"
//     userButton.style.borderRadius = "6px"
//     userButton.style.backgroundColor = "white"
//     userButton.style.boxShadow = "0 0 1px"
//     userButton.style.fontSize = "18px"
//     userButton.style.color = "black"
//     userButton.style.userSelect = "none"
//   }

//   function showPage(pageNumber) {
//     const startIndex = (pageNumber - 1) * itemsPerPage
//     const endIndex = startIndex + itemsPerPage

//     const rows = tableBody.querySelectorAll("tr.t_tr")
//     for (let i = 0; i < rows.length; i++) {
//       if (i >= startIndex && i < endIndex) {
//         rows[i].style.display = "table-row"
//         const firstCell = rows[i].querySelector("td:first-child")
//         firstCell.style.marginTop = "10px"
//       } else {
//         rows[i].style.display = "none"
//         const firstCell = rows[i].querySelector("td:first-child")
//         firstCell.style.marginTop = "0"
//       }
//     }
//   }

//   showPage(1)

//   function showPage(pageNumber) {
//     const startIndex = (pageNumber - 1) * itemsPerPage
//     const endIndex = startIndex + itemsPerPage

//     const rows = tableBody.querySelectorAll("tr.t_tr")
//     for (let i = 0; i < rows.length; i++) {
//       if (i >= startIndex && i < endIndex) {
//         rows[i].style.display = "table-row"
//         const firstCell = rows[i].querySelector("td:first-child")
//         firstCell.style.marginTop = "10px"
//       } else {
//         rows[i].style.display = "none"
//         const firstCell = rows[i].querySelector("td:first-child")
//         firstCell.style.marginTop = "0"
//       }
//     }
//   }
// })

// document.addEventListener("DOMContentLoaded", function () {
//   const itemsPerPage = 9 // 한 페이지에 보여줄 항목 개수
//   const tableBody = document.querySelector(".user_table tbody")
//   const paginationContainer = document.querySelector("#pagination-container")

//   // 테이블의 전체 행 개수
//   const totalItems = tableBody.querySelectorAll("tr.t_tr").length

//   // 전체 페이지 개수 계산
//   const totalPages = Math.ceil(totalItems / itemsPerPage)

//   // 현재 페이지 초기화
//   let currentPage = 1

//   // 페이지네이션 버튼 생성 및 이벤트 핸들링
//   const maxVisiblePages = 5 // 페이지네이션에 보여질 최대 페이지 버튼 개수
//   const additionalPage = 6 // 추가적인 페이지 번호
//   let startPage = 1
//   let endPage = Math.min(totalPages, maxVisiblePages)

//   function updatePaginationButtons() {
//     // 페이지 버튼 초기화
//     paginationContainer.innerHTML = ""

//     // 이전 버튼 생성
//     const prevButton = document.createElement("button")
//     prevButton.textContent = "〈"
//     prevButton.style.marginRight = "10px"
//     prevButton.style.padding = "8px"
//     prevButton.style.fontSize = "15px"
//     prevButton.style.border = "1px solid transparent"
//     prevButton.style.backgroundColor = "#f5f5f5"
//     prevButton.addEventListener("click", function () {
//       if (currentPage > 1) {
//         currentPage--
//         updatePageRange()
//         updatePaginationButtons()
//         showPage(currentPage)
//       }
//     })
//     paginationContainer.appendChild(prevButton)

//     // 페이지 버튼 생성 및 이벤트 핸들링
//     for (let i = startPage; i <= endPage; i++) {
//       const pageButton = document.createElement("button")
//       pageButton.textContent = i

//       pageButton.style.padding = "8px"
//       pageButton.style.margin = "5px"
//       pageButton.style.fontSize = "25px"
//       pageButton.style.border = "1px solid transparent"
//       pageButton.style.borderRadius = "6px"
//       pageButton.style.backgroundColor = "#f5f5f5"
//       pageButton.style.color = "black"
//       pageButton.style.fontWeight = "600"
//       pageButton.style.userSelect = "none"

//       if (i === currentPage) {
//         pageButton.style.border = "1px solid transparent"
//         pageButton.style.backgroundColor = "gray"
//         pageButton.style.color = "white"
//       }

//       pageButton.addEventListener("click", function () {
//         currentPage = i
//         updatePageRange()
//         updatePaginationButtons()
//         showPage(currentPage)
//       })
//       paginationContainer.appendChild(pageButton)
//       paginationContainer.style.margin = "30px auto 0 auto"
//       paginationContainer.style.display = "flex"
//       paginationContainer.style.justifyContent = "center"
//       paginationContainer.style.alignItems = "center"
//     }

//     // 다음 버튼 생성
//     const nextButton = document.createElement("button")
//     nextButton.textContent = "〉"
//     nextButton.style.marginLeft = "10px"
//     nextButton.style.padding = "8px"
//     nextButton.style.fontSize = "15px"
//     nextButton.style.border = "1px solid transparent"
//     nextButton.style.backgroundColor = "#f5f5f5"
//     nextButton.addEventListener("click", function () {
//       if (currentPage < totalPages) {
//         currentPage++
//         updatePageRange()
//         updatePaginationButtons()
//         showPage(currentPage)
//       }
//     })
//     paginationContainer.appendChild(nextButton)
//   }

//   function updatePageRange() {
//     if (currentPage <= Math.floor(maxVisiblePages / 2)) {
//       startPage = 1
//       endPage = Math.min(totalPages, maxVisiblePages)
//     } else if (currentPage >= totalPages - Math.floor(maxVisiblePages / 2)) {
//       startPage = Math.max(totalPages - maxVisiblePages + 1, 1)
//       endPage = totalPages
//     } else {
//       startPage = currentPage - Math.floor(maxVisiblePages / 2)
//       endPage = currentPage + Math.floor(maxVisiblePages / 2)
//     }

//     // 추가적인 페이지 버튼 생성
//     if (currentPage === totalPages && totalPages >= maxVisiblePages + 1) {
//       startPage = totalPages - maxVisiblePages + 1
//       endPage = totalPages
//     }
//   }

//   // 페이지 초기화
//   updatePaginationButtons()
//   showPage(currentPage)

//   // 해당 페이지의 항목들만 보여주는 함수
//   function showPage(pageNumber) {
//     const startIndex = (pageNumber - 1) * itemsPerPage
//     const endIndex = startIndex + itemsPerPage

//     const rows = tableBody.querySelectorAll("tr.t_tr")
//     for (let i = 0; i < rows.length; i++) {
//       if (i >= startIndex && i < endIndex) {
//         rows[i].style.display = "table-row"
//         const firstCell = rows[i].querySelector("td:first-child")
//         firstCell.style.marginTop = "10px"
//       } else {
//         rows[i].style.display = "none"
//         const firstCell = rows[i].querySelector("td:first-child")
//         firstCell.style.marginTop = "0"
//       }
//     }
//   }
// })

document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 9 // 한 페이지에 보여줄 항목 개수
  const tableBody = document.querySelector(".user_table tbody")
  const paginationContainer = document.querySelector("#pagination-container")

  // 테이블의 전체 행 개수
  const totalItems = tableBody.querySelectorAll("tr.t_tr").length

  // 전체 페이지 개수 계산
  const totalPages = Math.ceil(totalItems / itemsPerPage)

  // 현재 페이지 초기화
  let currentPage = 1

  // 페이지네이션 버튼 생성 및 이벤트 핸들링
  const maxVisiblePages = 5 // 페이지네이션에 보여질 최대 페이지 버튼 개수
  const additionalPage = 6 // 추가적인 페이지 번호
  let startPage = 1
  let endPage = Math.min(totalPages, maxVisiblePages)

  function updatePaginationButtons() {
    // 페이지 버튼 초기화
    paginationContainer.innerHTML = ""

    // 맨 처음 페이지로 가는 버튼 생성
    const firstButton = document.createElement("button")
    firstButton.textContent = "«"
    firstButton.style.marginRight = "10px"
    firstButton.style.padding = "8px"
    firstButton.style.fontSize = "20px"
    firstButton.style.border = "1px solid transparent"
    firstButton.style.backgroundColor = "#f5f5f5"
    firstButton.addEventListener("click", function () {
      currentPage = 1
      updatePageRange()
      updatePaginationButtons()
      showPage(currentPage)
    })
    paginationContainer.appendChild(firstButton)
    paginationContainer.style.margin = "35px auto 0 auto"
    paginationContainer.style.display = "flex"
    paginationContainer.style.justifyContent = "center"
    paginationContainer.style.alignItems = "center"

    // 이전 버튼 생성
    const prevButton = document.createElement("button")
    prevButton.textContent = "〈"
    prevButton.style.marginRight = "10px"
    prevButton.style.padding = "8px"
    prevButton.style.fontSize = "15px"
    prevButton.style.border = "1px solid transparent"
    prevButton.style.backgroundColor = "#f5f5f5"
    prevButton.addEventListener("click", function () {
      if (currentPage > 1) {
        currentPage--
        updatePageRange()
        updatePaginationButtons()
        showPage(currentPage)
      }
    })
    paginationContainer.appendChild(prevButton)

    // 페이지 버튼 생성 및 이벤트 핸들링
    for (let i = startPage; i <= endPage; i++) {
      const pageButton = document.createElement("button")
      pageButton.textContent = i

      pageButton.style.padding = "8px"
      pageButton.style.margin = "5px"
      pageButton.style.fontSize = "25px"
      pageButton.style.border = "1px solid transparent"
      pageButton.style.borderRadius = "6px"
      pageButton.style.backgroundColor = "#f5f5f5"
      pageButton.style.color = "black"
      pageButton.style.fontWeight = "600"
      pageButton.style.userSelect = "none"

      if (i === currentPage) {
        pageButton.style.backgroundColor = "gray"
        pageButton.style.color = "white"
      }

      pageButton.addEventListener("click", function () {
        currentPage = i
        updatePageRange()
        updatePaginationButtons()
        showPage(currentPage)
      })
      paginationContainer.appendChild(pageButton)
    }

    // 다음 버튼 생성
    const nextButton = document.createElement("button")
    nextButton.textContent = "〉"
    nextButton.style.marginLeft = "10px"
    nextButton.style.padding = "8px"
    nextButton.style.fontSize = "15px"
    nextButton.style.border = "1px solid transparent"
    nextButton.style.backgroundColor = "#f5f5f5"
    nextButton.addEventListener("click", function () {
      if (currentPage < totalPages) {
        currentPage++
        updatePageRange()
        updatePaginationButtons()
        showPage(currentPage)
      }
    })
    paginationContainer.appendChild(nextButton)

    // 맨 뒤 페이지로 가는 버튼 생성
    const lastButton = document.createElement("button")
    lastButton.textContent = "»"
    lastButton.style.marginLeft = "10px"
    lastButton.style.padding = "8px"
    lastButton.style.fontSize = "20px"
    lastButton.style.border = "1px solid transparent"
    lastButton.style.backgroundColor = "#f5f5f5"
    lastButton.addEventListener("click", function () {
      currentPage = totalPages
      updatePageRange()
      updatePaginationButtons()
      showPage(currentPage)
    })
    paginationContainer.appendChild(lastButton)
  }

  function updatePageRange() {
    if (currentPage <= Math.floor(maxVisiblePages / 2)) {
      startPage = 1
      endPage = Math.min(totalPages, maxVisiblePages)
    } else if (currentPage >= totalPages - Math.floor(maxVisiblePages / 2)) {
      startPage = Math.max(totalPages - maxVisiblePages + 1, 1)
      endPage = totalPages
    } else {
      startPage = currentPage - Math.floor(maxVisiblePages / 2)
      endPage = currentPage + Math.floor(maxVisiblePages / 2)
    }

    // 추가적인 페이지 버튼 생성
    if (currentPage === totalPages && totalPages >= maxVisiblePages + 1) {
      startPage = totalPages - maxVisiblePages + 1
      endPage = totalPages
    }
  }

  // 페이지 초기화
  updatePaginationButtons()
  showPage(currentPage)

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
