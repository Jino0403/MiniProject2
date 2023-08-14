const passwordInput = document.getElementById("password");
const confirmPasswordInput = document.getElementById("confirm-password");
const phoneInput = document.getElementById("phone");
const usernameInput = document.getElementById("username");
const nameInput = document.getElementById("name");
const adressInput = document.getElementById("adress")

/* 현재 날짜 체크 */
document.addEventListener("DOMContentLoaded", function () {
    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000;
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    birthday.setAttribute("max", today);
    
    // "생일" 입력 폼의 날짜가 변경될 때마다 호출되는 함수
    function checkAge() {
        const selectedDate = new Date(birthday.value);
        const today = new Date();
        const ageLimit = new Date(today.getFullYear() - 19, today.getMonth(), today.getDate());

        if (selectedDate > ageLimit) {
            alert("19세 미만의 회원은 가입할 수 없습니다.");
            birthday.value = ""; // 날짜 초기화
        }
    }

    // 생일 입력 폼의 값이 변경될 때마다 checkAge 함수 호출
    birthday.addEventListener("change", checkAge);
});

/* 정규 표현식 입력값 유효 체크 */
document.addEventListener("DOMContentLoaded", function () {
    const passwordError = document.getElementById("password-error");
    const confirmPasswordError = document.getElementById("confirm-password-error");
    const phoneError = document.getElementById("phone-error");
    const usernameError = document.getElementById("username-error");
    const nameError = document.getElementById("name-error");

    function showErrorMessage(element, message) {
        element.textContent = message;
        element.style.display = "block";
    }

    function clearErrorMessage(element) {
        element.textContent = "";
        element.style.display = "none";
    }

    function validatePassword() {
        const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,20}$/;
        if (!passwordInput.value) {
            showErrorMessage(passwordError, "비밀번호를 입력해주세요.");
        } else if (!passwordRegex.test(passwordInput.value)) {
            showErrorMessage(passwordError, "유효한 비밀번호를 입력해주세요.");
        } else {
            clearErrorMessage(passwordError);
        }
    }

    function validateConfirmPassword() {
        if (!confirmPasswordInput.value) {
            showErrorMessage(confirmPasswordError, "비밀번호 확인을 입력해주세요.");
        } else if (passwordInput.value !== confirmPasswordInput.value) {
            showErrorMessage(confirmPasswordError, "비밀번호가 일치하지 않습니다.");
        } else {
            clearErrorMessage(confirmPasswordError);
        }
    }

    function validatePhone() {
        const phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
        if (!phoneInput.value) {
            showErrorMessage(phoneError, "전화번호를 입력해주세요.");
        } else if (!phoneRegex.test(phoneInput.value)) {
            showErrorMessage(phoneError, "유효한 전화번호를 입력해주세요. (010-1111-1111)");
        } else {
            clearErrorMessage(phoneError);
        }
    }

    function validateUsername() {
        const usernameRegex = /^[a-zA-Z0-9]{6,20}$/;
        if (!usernameInput.value) {
            showErrorMessage(usernameError, "아이디를 입력해주세요.");
        } else if (!usernameRegex.test(usernameInput.value)) {
            showErrorMessage(usernameError, "6-20자의 영문 대소문자와 숫자만 입력 가능합니다.");
        } else {
            clearErrorMessage(usernameError);
        }
    }

    function validateName() {
        const nameRegex = /^[가-힣]+$/;
        if (!nameInput.value) {
            showErrorMessage(nameError, "이름을 입력해주세요.");
        } else if (!nameRegex.test(nameInput.value)) {
            showErrorMessage(nameError, "한글 이름만 입력 가능합니다.");
        } else {
            clearErrorMessage(nameError);
        }
    }

    passwordInput.addEventListener("input", validatePassword);
    confirmPasswordInput.addEventListener("input", validateConfirmPassword);
    phoneInput.addEventListener("input", validatePhone);
    usernameInput.addEventListener("input", validateUsername);
    nameInput.addEventListener("input", validateName);
});
