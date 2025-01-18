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
        <form action="submitSkill" method="post">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" required><br><br>

     <label for="userID">User ID:</label>
<input type="text" id="userID" name="userID" required><br><br>


            <label for="careerID">Career ID:</label>
            <input type="text" id="careerID" name="careerID" required><br><br>

            <label for="skillName">Skill Name:</label>
            <input type="text" id="skillName" name="skillName" required><br><br>

            <label for="levelSkill">Level Skill:</label>
<input type="text" id="levelSkill" name="levelSkill" required><br><br>


<label for="updated_date">Updated Date:</label>
<input type="text" id="updated_date" name="UpdatedDate" placeholder="dd-MM-yyyy" required><br><br>

<script>
    document.getElementById("yourFormId").onsubmit = function() {
        var updatedDateStr = document.getElementById("updated_date").value;
        if (updatedDateStr) {
            // Convert dd-MM-yyyy to yyyy-MM-dd
            var dateParts = updatedDateStr.split("-");
            if (dateParts.length === 3) {
                var formattedDate = dateParts[2] + "-" + dateParts[1] + "-" + dateParts[0];
                document.getElementById("updated_date").value = formattedDate;  // Set the value to yyyy-MM-dd format
            }
        }
    };
</script>

            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value="Technology">Technology</option>
                <option value="Engineering">Engineering</option>
                <option value="Construction">Construction</option>
                <option value="Marketing">Marketing</option>
                <option value="Finance">Finance</option>
                <option value="Healthcare">Health care</option>
                <option value="Creative">Creative</option>
                <option value="Science">Science</option>
                <option value="Human Resources">Human Resources</option>
            </select><br><br>

            <input type="submit" value="Submit">
        </form>
    </div>
</div>

</body>
</html>
