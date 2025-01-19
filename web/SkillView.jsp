<%@ page import="model.Skill" %>
<%
    Skill skill = (Skill) request.getAttribute("skill");
%>
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
            <h1>Skill Assessment Results</h1>
            <p><strong>ID:</strong> <%= skill.getId() %></p>
            <p><strong>User ID:</strong> <%= skill.getUserID() %></p>
            <p><strong>Career ID:</strong> <%= skill.getCareerID() %></p>
            <p><strong>Updated Date:</strong> <%= skill.getUpdatedDate() %></p>
            <p><strong>Skill Level:</strong> <%= skill.getLevelSkill() %></p>
            <p><strong>Industry</strong> <%= skill.getIndustry() %></p> <!-- Displaying category -->
        </div>
    </div>
</body>
</html>