const passMessage = document.getElementById("msg-error-pass");
const confirmMessage = document.getElementById("msg-error-pass-confirm");
const oldPassMessage = document.getElementById("pass-old");

const passElement = document.getElementById("reg-pass");
const confirmElement = document.getElementById("reg-pass-confirm");
const oldPassElement = document.getElementById("reg-old");

const validateChangePasswordForm = () =>{
    let isValid = true;
    if(!isValidatePassword(oldPassElement, oldPassMessage)) isValid = false;
    if(!isValidatePassword(passElement, passMessage)) isValid = false;
    if(!isValidatePasswordConfirm()) isValid = false;
    return isValid;
}

const isValidatePassword = (element, message) => {
    const pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    if (isEmpty(element)) {
        setEmptyError('Password', element, message);
        return false;
    } else if (!isMatch(pattern, element)) {
        setMatchPasswordError(element, message);
        return false;
    } else {
        hideError(element, message);
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

const setEmptyError = (name, element, message) => {
    message.innerText = `${name} is required`
    setError(element, message);
}

const isEmpty = (element) => {
    return element.value === '';
}

const isMatch = (pattern, element) => {
    return element.value.match(pattern) !== null;
}

const isMatchWithPassword = () => {
    return passElement.value === confirmElement.value;
}

const setMatchConfirmError = () => {
    confirmMessage.innerText = `The password confirmation does not match`;
    setError(confirmElement, confirmMessage);
}

const setMatchPasswordError = (element, message) => {
    message.innerText = `Password must be between 6 to 20 characters which contain at least one numeric digit, one uppercase and one lowercase letter`;
    setError(element, message);
}

const hideError = (element, message) => {
    message.style.display = "none";
    element.style.borderColor = "#e0e0e0";
    element.style.backgroundColor = 'white';
}

const setError = (element, message) => {
    message.style.display = "block";
    element.style.borderColor = "red";
    element.style.backgroundColor = 'rgb(246 218 218)';
}
