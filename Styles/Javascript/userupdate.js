let selectedMembers = [];

// 체크박스 클릭 시 selectedMembers 배열 업데이트
const checkboxes = document.querySelectorAll('.memberCheckbox');
checkboxes.forEach(checkbox => {
    checkbox.addEventListener('click', () => {
        const memberId = checkbox.value;
        if (checkbox.checked) {
            selectedMembers.push(memberId);
        } else {
            selectedMembers = selectedMembers.filter(id => id !== memberId);
        }
        document.getElementById('delselectedMember').value = selectedMembers.join(',');
    });
});