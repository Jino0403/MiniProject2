let selectedProduct = [];

// 체크박스 클릭 시 selectedMembers 배열 업데이트
const checkboxes = document.querySelectorAll('.productCheckbox');
checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        const productId = checkbox.value;

        if (checkbox.checked) {
            if (selectedProduct.length > 0) {
                alert("하나의 고객만 선택할 수 있습니다.");
                checkbox.checked = false; // 체크를 해제하여 하나의 고객만 선택되도록 함
            } else {
                selectedProduct = [productId]; // 선택한 체크박스의 memberId로 배열 업데이트
            }
        } else {
            selectedProduct = [];
        }

        document.getElementById('delselectedProduct').value = selectedProduct.join(',');
        document.getElementById('updateselectedProduct').value = selectedProduct.join(',');
    });
});
