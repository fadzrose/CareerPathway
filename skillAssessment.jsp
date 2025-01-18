<%-- 
    Document   : sideBarWithAssessment
    Created on : Jan 19, 2025, 1:09:21 AM
    Author     : Iffah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skill Assessment</title>
   <style>
    /* Basic Styles */
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9; /* Light background for the body */
        color: #333; /* Dark text color for contrast */
    }

    /* Sidebar */
    .sidebar {
        height: 100vh;
        width: 250px;
        background-color: #2c3e50;
        color: #fff;
        position: fixed;
        display: flex;
        flex-direction: column;
        padding: 20px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        transition: width 0.3s ease;
    }

    .sidebar a {
        color: #ecf0f1;
        text-decoration: none;
        margin: 15px 0;
        font-size: 18px;
        display: block;
        padding: 8px 0;
        border-radius: 4px;
        transition: background-color 0.3s ease, padding-left 0.3s ease;
    }

    .sidebar a:hover {
        background-color: #2980b9;
        padding-left: 15px;
    }

    /* Header */
    .header {
        background-color: #00a2d1;
        color: white;
        padding: 15px 20px;
        text-align: center;
        font-size: 26px;
        font-weight: 700;
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        z-index: 1;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: top 0.3s ease;
    }

    /* Content */
    .content {
        margin-left: 250px; /* Adjusted for the sidebar width */
        margin-top: 70px; /* To avoid overlap with the fixed header */
        padding: 30px;
        transition: margin-left 0.3s ease, margin-top 0.3s ease;
    }

    /* Assessment Section */
    .assessment {
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
        transition: box-shadow 0.3s ease;
    }

    .assessment:hover {
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
    }

    .assessment h2 {
        margin-top: 0;
        font-size: 22px;
        font-weight: 600;
        color: #2c3e50;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .sidebar {
            width: 200px; /* Make sidebar a bit smaller on small screens */
        }

        .content {
            margin-left: 200px;
            margin-top: 80px; /* Adjust for smaller sidebar */
        }

        .header {
            font-size: 20px; /* Adjust header font size on small screens */
        }
    }

    @media (max-width: 480px) {
        .sidebar {
            width: 100%; /* Sidebar takes full width on very small screens */
            height: auto; /* Allow sidebar to expand vertically */
            position: relative;
        }

        .content {
            margin-left: 0;
        }

        .header {
            font-size: 18px;
        }
    }

</style>

</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Career Pathway</h3>
        <a href="#">Dashboard</a>
        <a href="skillAssessment.jsp">Skills</a>
        <a href="#">Career</a>
        <a href="#">Progress</a>
    </div>

    <!-- Header -->
    <div class="header">Skills Assessment</div>

<!-- Content -->
<div class="content">
    <!-- Assessment Section -->
    <div class="assessment">
          <h1>Enter your skill information</h1>
    <form action="submitSkill" method="post" id="skillForm">
        <!-- Basic Information -->
        <label for="skillName">Skill Name:</label>
        <input type="text" id="skillName" name="skillName" required><br><br>

        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br><br>

        <label for="userID">User ID:</label>
        <input type="text" id="userID" name="userID" required><br><br>

        <label for="careerID">Career ID:</label>
        <input type="text" id="careerID" name="careerID" required><br><br>

        <label for="updated_date">Updated Date:</label>
        <input type="text" id="updated_date" name="UpdatedDate" placeholder="dd-MM-yyyy" required><br><br>

        <!-- Skill Categories -->
        <h3>Skill Categories</h3>
        <label for="category">Category:</label>
        <select id="category" name="category">
            <option value="Technology">Technology</option>
            <option value="Engineering">Engineering</option>
            <option value="Construction">Construction</option>
            <option value="Marketing">Marketing</option>
            <option value="Finance">Finance</option>
            <option value="Healthcare">Healthcare</option>
            <option value="Creative">Creative</option>
            <option value="Science">Science</option>
            <option value="Human Resources">Human Resources</option>
        </select><br><br>

        <!-- Skill Assessment Questions (for each category) -->
        <h3>Self-Assessment Questions</h3>

        <!-- Experience-based Questions -->
        <label for="experience">How many years of experience do you have in this skill?</label><br>
        <input type="number" id="experience" name="experience" min="0" required><br><br>

        <!-- Comfort/Proficiency-based Questions -->
        <label for="comfortLevel">How comfortable are you using this skill in real-world scenarios?</label><br>
        <select id="comfortLevel" name="comfortLevel" required>
            <option value="1">Not Comfortable</option>
            <option value="2">Somewhat Comfortable</option>
            <option value="3">Comfortable</option>
            <option value="4">Very Comfortable</option>
        </select><br><br>

        <!-- Behavioral Questions -->
        <label for="projectExperience">Have you applied this skill in challenging projects?</label><br>
        <select id="projectExperience" name="projectExperience" required>
            <option value="0">No</option>
            <option value="1">Yes</option>
        </select><br><br>

        <!-- Certifications/Training -->
        <label for="certification">Do you hold any certifications for this skill?</label><br>
        <select id="certification" name="certification" required>
            <option value="0">No</option>
            <option value="1">Yes</option>
        </select><br><br>

        <!-- Display Skill Level -->
        <label for="levelSkill">Skill Level:</label>
        <input type="text" id="levelSkill" name="levelSkill" readonly><br><br>

        <!-- Submit Button -->
        <input type="submit" value="Submit">
    </form>

    <script>
        // Function to calculate skill level based on user answers
        function calculateSkillLevel() {
            var experience = parseInt(document.getElementById("experience").value);
            var comfortLevel = parseInt(document.getElementById("comfortLevel").value);
            var projectExperience = parseInt(document.getElementById("projectExperience").value);
            var certification = parseInt(document.getElementById("certification").value);

            var skillLevelScore = 0;

            // Add points based on experience
            if (experience >= 5) {
                skillLevelScore += 3;
            } else if (experience >= 2) {
                skillLevelScore += 2;
            } else {
                skillLevelScore += 1;
            }

            // Add points based on comfort level
            skillLevelScore += comfortLevel;

            // Add points if the user has project experience
            if (projectExperience === 1) {
                skillLevelScore += 2;
            }

            // Add points for certifications
            if (certification === 1) {
                skillLevelScore += 2;
            }

            // Determine skill level based on total score
            var level = "";
            if (skillLevelScore >= 8) {
                level = "Expert";
            } else if (skillLevelScore >= 5) {
                level = "Advanced";
            } else if (skillLevelScore >= 3) {
                level = "Intermediate";
            } else {
                level = "Beginner";
            }

            // Display calculated skill level
            document.getElementById("levelSkill").value = level;
        }

        // Attach event listeners to recalculate skill level when any question changes
        document.getElementById("experience").addEventListener("input", calculateSkillLevel);
        document.getElementById("comfortLevel").addEventListener("change", calculateSkillLevel);
        document.getElementById("projectExperience").addEventListener("change", calculateSkillLevel);
        document.getElementById("certification").addEventListener("change", calculateSkillLevel);

        // Form submission handler
        document.getElementById("skillForm").onsubmit = function(event) {
            event.preventDefault();  // Prevent form submission until calculation is done
            calculateSkillLevel();   // Calculate skill level
            this.submit();           // Submit the form after calculation
        };
    </script>
       

    </div>
</div>

</body>
</html>
