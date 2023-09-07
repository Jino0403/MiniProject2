document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 4; // 한 페이지에 보여줄 항목 개수
  const tableBody = document.querySelector(".pro_table tbody");
  const paginationContainer = document.getElementById("pagination-container");

  // 테이블의 전체 행 개수
  const totalItems = tableBody.querySelectorAll("tr.t_tr").length;

  // 전체 페이지 개수 계산
  const totalPages = Math.ceil(totalItems / itemsPerPage);

  // 현재 페이지 번호를 저장할 변수
  let currentPage = 1;

  // 페이지네이션 버튼 생성 및 이벤트 핸들링
  function createPaginationButtons() {
    paginationContainer.innerHTML = "";

    // paginationContainer에 스타일 추가
    paginationContainer.style.marginTop = "30px";
    paginationContainer.style.display = "flex";
    paginationContainer.style.justifyContent = "space-between";
    paginationContainer.style.alignItems = "center";
    paginationContainer.style.height = "100%";

    // 페이지 링크를 5개로 제한
    const maxPageLinks = 5;
    let startPage = Math.max(1, currentPage - Math.floor(maxPageLinks / 2));
    let endPage = Math.min(totalPages, startPage + maxPageLinks - 1);

    // 조정된 페이지 범위
    if (endPage - startPage + 1 < maxPageLinks) {
      startPage = Math.max(1, endPage - maxPageLinks + 1);
    }

    // 맨 앞 버튼 (첫 페이지로 이동)
    const firstButton = document.createElement("button");
    firstButton.textContent = "처음";
    firstButton.addEventListener("click", function () {
      showPage(1);
    });
    
    firstButton.style.height = "60px";
    firstButton.style.border = "3px solid transparent";
    firstButton.style.backgroundColor = "#f5f5f5";
    firstButton.style.color = "black";
    firstButton.style.fontSize = "20px";
    firstButton.style.fontWeight = "600";

    // 이벤트 추가: hover 상태일 때 color를 red로 변경
    firstButton.addEventListener("mouseenter", function () {
      firstButton.style.color = "red";
      firstButton.style.fontWeight = "bold";
    });
    firstButton.addEventListener("mouseleave", function () {
      firstButton.style.color = ""; // 원래 상태로 복원
    });

    firstButton.style.border = "1px solid transparent";
    firstButton.style.backgroundColor = "#f5f5f5";
    firstButton.style.padding = "4px";
    firstButton.style.fontSize = "20px";

    // 이전 버튼
    const prevButton = document.createElement("button");
    prevButton.textContent = "이전";
    prevButton.addEventListener("click", function () {
      if (currentPage > 1) {
        showPage(currentPage - 1);
      }
    });
    
    prevButton.style.height = "60px";
    prevButton.style.border = "3px solid transparent";
    prevButton.style.backgroundColor = "#f5f5f5";
    prevButton.style.color = "black";
    prevButton.style.fontSize = "20px";
    prevButton.style.fontWeight = "600";

    // 이벤트 추가: hover 상태일 때 color를 red로 변경
    prevButton.addEventListener("mouseenter", function () {
      prevButton.style.color = "red";
      prevButton.style.fontWeight = "bold";
    });
    prevButton.addEventListener("mouseleave", function () {
      prevButton.style.color = ""; // 원래 상태로 복원
    });



    paginationContainer.appendChild(firstButton);
    paginationContainer.appendChild(prevButton);

    // 페이지 번호 버튼 생성
    for (let i = startPage; i <= endPage; i++) {
      const pageButton = document.createElement("button");
      pageButton.textContent = i;

      pageButton.addEventListener("click", function () {
        showPage(i);
      });

      // pageButton에 스타일 추가
      pageButton.style.fontSize = "25px";
      pageButton.style.margin = "0 10px";
      pageButton.style.padding = "5px";
      pageButton.style.border = "none";
      pageButton.style.borderRadius = "8px";
      pageButton.style.backgroundColor = "black";
      pageButton.style.color = "white";
      
      // 이벤트 추가: hover 상태일 때 color를 red로 변경
      pageButton.addEventListener("mouseenter", function () {
		pageButton.style.fontWeight = "bold";
      });
      pageButton.addEventListener("mouseleave", function () {
        pageButton.style.color = "white"; // 원래 상태로 복원
        pageButton.style.fontWeight = "";
      });



      if (i === currentPage) {
        pageButton.classList.add("active");
      }

      paginationContainer.appendChild(pageButton);
    }

    // 다음 버튼
    const nextButton = document.createElement("button");
    nextButton.textContent = "다음";
    nextButton.addEventListener("click", function () {
      if (currentPage < totalPages) {
        showPage(currentPage + 1);
      }
    });
    
    nextButton.style.height = "60px";
    nextButton.style.border = "3px solid transparent";
    nextButton.style.backgroundColor = "#f5f5f5";
    nextButton.style.color = "black";
    nextButton.style.fontSize = "20px";
    nextButton.style.fontWeight = "600";

    // 이벤트 추가: hover 상태일 때 color를 red로 변경
    nextButton.addEventListener("mouseenter", function () {
      nextButton.style.color = "red";
      nextButton.style.fontWeight = "bold";
    });
    nextButton.addEventListener("mouseleave", function () {
      nextButton.style.color = ""; // 원래 상태로 복원
    });

    // nextButton에 스타일 추가
    nextButton.style.border = "1px solid transparent";

    // 맨 뒤 버튼 (마지막 페이지로 이동)
    const lastButton = document.createElement("button");
    lastButton.textContent = "맨뒤";
    lastButton.addEventListener("click", function () {
      showPage(totalPages);
    });
    
    lastButton.style.height = "60px";
    lastButton.style.border = "3px solid transparent";
    lastButton.style.backgroundColor = "#f5f5f5";
    lastButton.style.color = "black";
    lastButton.style.fontSize = "20px";
    lastButton.style.fontWeight = "600";

    // 이벤트 추가: hover 상태일 때 color를 red로 변경
    lastButton.addEventListener("mouseenter", function () {
      lastButton.style.color = "red";
      lastButton.style.fontWeight = "bold";
    });
    lastButton.addEventListener("mouseleave", function () {
      lastButton.style.color = ""; // 원래 상태로 복원
    });

    paginationContainer.appendChild(nextButton);
    paginationContainer.appendChild(lastButton);
  }

  // 페이지 초기화
  showPage(1);

  // 해당 페이지의 항목들만 보여주는 함수
  function showPage(pageNumber) {
    currentPage = pageNumber;

    const startIndex = (pageNumber - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;

    const rows = tableBody.querySelectorAll("tr.t_tr");
    for (let i = 0; i < rows.length; i++) {
      if (i >= startIndex && i < endIndex) {
        rows[i].style.display = "table-row";
      } else {
        rows[i].style.display = "none";
      }
    }

    createPaginationButtons();
  }
});