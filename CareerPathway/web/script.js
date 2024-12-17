const wrapper = document.querySelector('.wrapper')
const registerLink = document.querySelector('.register-link')
const loginLink = document.querySelector('.login-link')

registerLink.onclick = () => {
    wrapper.classList.add('active')
}

loginLink.onclick = () => {
    wrapper.classList.remove('active')
}

// Example: Dynamic Greeting
document.addEventListener("DOMContentLoaded", () => {
  const header = document.querySelector("header h1");
  const userName = "John Doe"; // Replace with dynamic data
  header.textContent = Welcome, ${userName};
});

