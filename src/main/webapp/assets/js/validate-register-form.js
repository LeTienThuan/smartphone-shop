const nameMessage = document.getElementById("msg-error-name");
const emailMessage = document.getElementById("msg-error-email");
const phoneMessage = document.getElementById("msg-error-phone");
const passMessage = document.getElementById("msg-error-pass");
const confirmMessage = document.getElementById("msg-error-pass-confirm");

const nameElement = document.getElementById("reg-name");
const emailElement = document.getElementById("reg-email");
const phoneElement = document.getElementById("reg-phone");
const passElement = document.getElementById("reg-pass");
const confirmElement = document.getElementById("reg-pass-confirm");

const isValidateRegisterForm = () => {
    let isValidForm = true;
    if (!isValidName()) isValidForm = false;
    if (!isValidateEmail(emailElement, emailMessage)) isValidForm = false;
    if (!isValidatePhone()) isValidForm = false;
    if (!isValidatePassword()) isValidForm = false;
    if (!isValidatePasswordConfirm()) isValidForm = false;
    return isValidForm;
}

const displayFailRegister = () => {
    if (emailMessage.innerText !== '') {
        emailElement.style.borderColor = 'red';
        emailElement.style.backgroundColor = 'rgb(246 218 218)';
    }
}

displayFailRegister();

const isValidName = () => {
    if (isEmpty(nameElement)) {
        setEmptyError('Name', nameElement, nameMessage);
        return false;
    } else {
        hideError(nameElement, nameMessage);
        return true;
    }
}
const isValidateEmail = (element, message) => {
    const pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (isEmpty(element)) {
        setEmptyError('Email', element, message);
        return false;
    } else if (!isMatch(pattern, element)) {
        setMatchError('email', element, message);
        return false;
    } else {
        hideError(element, message);
        return true;
    }
}

const isValidatePhone = () => {
    const pattern = /^\d{10}$/;
    if (isEmpty(phoneElement)) {
        setEmptyError('Number phone', phoneElement, phoneMessage);
        return false;
    } else if (!isMatch(pattern, phoneElement)) {
        setMatchError('number phone', phoneElement, phoneMessage);
        return false;
    } else {
        hideError(phoneElement, phoneMessage);
        return true;
    }
}
const isValidatePassword = () => {
    const pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    if (isEmpty(passElement)) {
        setEmptyError('Password', passElement, passMessage);
        return false;
    } else if (!isMatch(pattern, passElement)) {
        setMatchPasswordError();
        return false;
    } else {
        hideError(passElement, passMessage);
        return true;
    }
}

const isValidatePasswordConfirm = () => {
    if (isEmpty(confirmElement)) {
        setEmptyError('Password confirm', confirmElement, confirmMessage);
        return false;
    } else if (!isMatchWithPassword()) {
        setMatchConfirmError();
        return false;
    } else {
        hideError(confirmElement, confirmMessage);
        return true;
    }
}

const setMatchConfirmError = () => {
    confirmMessage.innerText = `The password confirmation does not match`;
    setError(confirmElement, confirmMessage);
}

const isMatchWithPassword = () => {
    return passElement.value === confirmElement.value;
}

const setMatchPasswordError = () => {
    passMessage.innerText = `Password must be between 6 to 20 characters which contain at least one numeric digit, one uppercase and one lowercase letter`;
    setError(passElement, passMessage);
}

const setMatchError = (name, element, message) => {
    message.innerText = `You have entered an invalid ${name}`;
    setError(element, message);
}

const setEmptyError = (name, element, message) => {
    message.innerText = `${name} is required`
    setError(element, message);
}

const isMatch = (pattern, element) => {
    return element.value.match(pattern) !== null;
}

const isEmpty = (element) => {
    return element.value === '';
}

const setError = (element, message) => {
    message.style.display = "block";
    element.style.borderColor = "red";
    element.style.backgroundColor = 'rgb(246 218 218)';
}

const hideError = (element, message) => {
    message.style.display = "none";
    element.style.borderColor = "#e0e0e0";
    element.style.backgroundColor = 'white';
}

