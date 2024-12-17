document.addEventListener("DOMContentLoaded", () => {
    // Simulate fetching user role after login
    const userRole = localStorage.getItem("userRole") || "normal"; // Default to "normal"

    // Update the UI with the user's role
    const userRoleSpan = document.getElementById("user-role");
    userRoleSpan.textContent = userRole === "admin" ? "Administrator" : "Normal User";

    // Hide update buttons and input fields for normal users
    if (userRole === "normal") {
        const updateButtons = document.querySelectorAll(".update-btn");
        const inputFields = document.querySelectorAll("input[type='number']");
        updateButtons.forEach((button) => (button.style.display = "none"));
        inputFields.forEach((input) => (input.style.display = "none"));
    }
});

function updateProgress(module) {
    const inputField = document.getElementById(${module}-input);
    const newValue = inputField.value;

    // Validate input
    if (newValue < 0 || newValue > 100 || newValue === "") {
        alert("Please enter a valid percentage between 0 and 100.");
        return;
    }

    // Update progress bar and percentage
    const progressBar = document.getElementById(${module}-progress);
    const percentageText = document.getElementById(${module}-percentage);
    progressBar.style.width = ${newValue}%;
    percentageText.textContent = ${newValue}%;

    // Clear the input field
    inputField.value = "";
}

function simulateLogin(role) {
    localStorage.setItem("userRole", role);
    alert(Logged in as: ${role});
}