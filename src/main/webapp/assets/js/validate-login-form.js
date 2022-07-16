const loginMessage = document.getElementById("msg-login-error");
const emailElement = document.getElementById("reg-email");
const passwordElement = document.getElementById("reg-pass");

const validateLoginForm = () => {
    if (loginMessage.innerText !== '') {
        displayFailLogin();
    }
}

const displayFailLogin = () => {
    emailElement.style.borderColor = "red";
    emailElement.style.backgroundColor = 'rgb(246 218 218)'
    passwordElement.style.borderColor = "red";
    passwordElement.style.backgroundColor = 'rgb(246 218 218)';
}

validateLoginForm();