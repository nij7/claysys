document.addEventListener('DOMContentLoaded', () => {
    const dob = document.getElementById('dob');
    const age = document.getElementById('age');
    const firstName = document.getElementById('firstName');
    const lastName = document.getElementById('lastName');
    const phone = document.getElementById('phone');
    const state = document.getElementById('state');
    const city = document.getElementById('city');
    const password = document.getElementById('password');
    const passwordHelp = document.getElementById('passwordHelp');
    const registrationForm = document.getElementById('registrationForm');

    //date
    dob.addEventListener('change', () => {
        const birthDate = new Date(dob.value);
        const today = new Date();
        let ageValue = today.getFullYear() - birthDate.getFullYear();
        const monthDifference = today.getMonth() - birthDate.getMonth();
        if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
            ageValue--;
        }
        age.value = ageValue;
    });

    // name
    const validateName = (name) => /^[A-Za-z]+$/.test(name);

    firstName.addEventListener('input', () => {
        if (!validateName(firstName.value)) {
            firstName.setCustomValidity('First name should contain only letters.');
        } else {
            firstName.setCustomValidity('');
        }
    });

    lastName.addEventListener('input', () => {
        if (!validateName(lastName.value)) {
            lastName.setCustomValidity('Last name should contain only letters.');
        } else {
            lastName.setCustomValidity('');
        }
    });

    // phn
    phone.addEventListener('input', () => {
        if (!/^\d+$/.test(phone.value)) {
            phone.setCustomValidity('Phone number should contain only digits.');
        } else {
            phone.setCustomValidity('');
        }
    });

    // Show city options based on the selected state
    const cityOptions = {
        kerala: ['Kochi','Kottayam', 'Trivandrum','Pathanamthitta'],
        tamilnadu: ['Chennai', 'Manglore','Coimbatore'],
        karnataka: ['Bangalore','Whitefield', 'Mysore']
    };

    state.addEventListener('change', () => {
        city.innerHTML = '<option value="">Select City</option>';
        if (state.value) {
            cityOptions[state.value].forEach(cityName => {
                const option = document.createElement('option');
                option.value = cityName.toLowerCase();
                option.textContent = cityName;
                city.appendChild(option);
            });
        }
    });

    // Validate for strong passwords
    password.addEventListener('input', () => {
        const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#]).{8,}$/;
        if (!strongPasswordRegex.test(password.value)) {
            passwordHelp.textContent = 'Password must be at least 8 characters long, contain uppercase and lowercase letters, a number, and a special character.';
            password.setCustomValidity('Weak password.');
        } else {
            passwordHelp.textContent = '';
            password.setCustomValidity('');
        }
    });

    // Form submission
    registrationForm.addEventListener('submit', (event) => {
        if (password.value !== document.getElementById('confirmPassword').value) {
            event.preventDefault();
            alert('Passwords do not match.');
        }
    });
});
