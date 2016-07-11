function formValidation() {
	// Make quick references to our fields.
	var name = document.getElementById('name');
	var salary = document.getElementById('salary');
	var email = document.getElementById('email');
	// To check empty form fields.
	if (name.value.length == 0) {
		document.getElementById('head').innerText = "* All fields are mandatory *"; // This
		name.focus();
		return false;
	}
	// Check each input in the order that it appears in the form.
	if (inputAlphabet(name, "* For your name please use alphabets only *")) {
		if (salaryValidation(salary, "* Please enter only digits")) {
			if (emailValidation(email, "* Please enter a valid email address *")) {
				return true;
			}
		}

	}
	return false;
}
// Function that checks whether input text is numeric or not.
function salaryValidation(inputtext, alertMsg) {
	var numericExpression = /^[0-9]+$/;
	if (inputtext.value.match(numericExpression)) {
		return true;	
	} else {
		document.getElementById('salary').innerText = alertMsg; // This segment
		// displays the
		// validation rule
		// for zip.
		inputtext.focus();
		return false;
	}
}
// Function that checks whether input text is an alphabetic character or not.
function inputAlphabet(inputtext, alertMsg) {
	var alphaExp = /^[a-zA-Z]+$/;
	if (inputtext.value.match(alphaExp)) {
		return true;
	} else {
		document.getElementById('name').innerText = alertMsg; // This segment
		// displays the
		// validation rule
		// for name.
		// alert(alertMsg);
		inputtext.focus();
		return false;
	}
}
function emailValidation(inputtext, alertMsg) {
	var emailExp = /^[w-.+]+@[a-zA-Z0-9.-]+.[a-zA-z0-9]{2,4}$/;
	if (inputtext.value.match(emailExp)) {
		return true;
	} else {
		document.getElementById('p3').innerText = alertMsg; // This segment
		// displays the
		// validation rule
		// for email.
		inputtext.focus();
		return false;
	}
}