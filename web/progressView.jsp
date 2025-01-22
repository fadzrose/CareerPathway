<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get CareerID from request
    String cID = request.getParameter("careerID");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Career Progress Tracker</title>
    <style>
        /* Basic Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #00a2d1;
            color: white;
            padding: 15px;
        
            text-align: center;
            position: fixed;
            top: 0;
            width: 100%;
        }
        .sidebar {
        width: 200px;
        height: 100vh;
        background-color: #00789e;
        color: #fff;
        position: fixed;
        padding: 20px;
        margin-top: -16px;
        }

        .sidebar h2 {
        margin-bottom: 20px;
        font-size: 20px;
        text-align: center;
        }

        .sidebar ul {
        list-style-type: none;
        padding: 0;
        }

        .sidebar ul li {
        margin: 15px 0;
        }

        .sidebar ul li a {
        color: #fff;
        text-decoration: none;
        }

        .sidebar ul li a:hover {
        color: #00bcd4;
        }
        

        /* Main Content */
        .main-content {
            margin-top: 125px;
            margin-left: 250px;
            padding: 20px;
            background-color: #f8f9fa;
        }

        /* Profile Section */
        .profile {
            display: flex;
            align-items: center;
            background-color: #e8f5fc;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .profile img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-right: 20px;
            background-color: #ddd; /* Placeholder for profile picture */
            margin-left: 20px; /* Adjust this value to move the heading to the right */
        
        }
        .profile div {
            font-size: 18px;
        }

        /* Responsive Breakpoints */
        @media (max-width: 1024px) {
            .card {
                flex: 1 1 calc(50% - 20px); /* Two cards per row */
            }
        }

        @media (max-width: 768px) {
            .card {
                flex: 1 1 100%; /* One card per row */
            }
        }
        .cards {
            display: flex;
            flex-wrap: wrap; /* Allow wrapping for responsiveness */
            justify-content: space-between;
            gap: 20px; /* Add spacing between cards */
            margin-bottom: 20px;
        }

        .card {
            background-color: #e8f5fc;
            flex: 1 1 calc(25% - 20px); /* Flexible basis with margin adjustment */
            margin: 0;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow for a modern look */
        }
        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .card button {
            background-color: #00a2d1;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }
        .card button:hover {
            background-color: #0079a3;
        }

        /* Assessment Table */
        .assessment-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            transform-origin: top left;
            
            margin-right: 15px;
        }
        .assessment-table th, .assessment-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .assessment-table th {
            background-color: #00a2d1;
            color: white;
        }
        .assessment-table td a {
            color: #00a2d1;
            text-decoration: none;
        }
        .assessment-table td a:hover {
            text-decoration: underline;
        }
        h3 {
            margin-left: 30px; /* Adjust this value to move the heading to the right */
        }
        
    </style>
</head>
<body>
    
    <header>
        <h1>Career Recommendation Engine</h1>
        
    </header>
    <div class="sidebar">
        <h2>Career Pathway</h2>
        <ul>
            <li><a href="dashboard.html">Dashboard</a></li>
            
            <li><a href="CareerEngine.jsp">Career</a></li>
            <li><a href="progressView.jsp">Skills</a></li>
        </ul>
    </div>

    <div class="main-content">
        <h1>Main Content</h1>
        <%
            // Declare the ResultSet and other resources outside of the try block
            Connection conn = null;
            Statement stat = null;
            ResultSet rs = null;
            ResultSet rs2 = null; // Declare rs2 here

            try {
                // Get database connection (make sure your DB URL, user, and password are correct)
                Class.forName("org.apache.derby.jdbc.ClientDriver");

                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CareerPathway", "app","app");
              
                stat = conn.createStatement();

                // First query: Retrieve Career Data
                rs = stat.executeQuery("SELECT * FROM CAREER");
                if (rs.next()) {
                    Integer phase = rs.getInt("Phase_level");
                    String level = "";
                    if (phase == 1) {
                        level = "Entry-Level";
                    } else if (phase == 2) {
                        level = "Mid-Level";
                    } else if (phase == 3) {
                        level = "Advanced-Level";
                    } else {
                        level = "Not Defined";
                    }
        %>
        <div id="career-info">
            <h3>Career Details</h3>
            <p><strong>Position:</strong> <span id="position"><%= rs.getString("position") %></span></p>
            <p><strong>Description:</strong> <span id="description"><%= rs.getString("description") %></span></p>
            <p><strong>Industry:</strong> <%= level %></p>
            <p><strong>Average Salary:</strong> <span id="avg-salary">RM <%= rs.getString("ave_salary") %>0</span></p><br>
            <a class="btn" href="skillAssessment.jsp?careerID=<%= rs.getInt("CareerID") %>">Add Skill</a>
        </div>
        <%
            }
            // Second query: Retrieve Skills
            String query2 = "SELECT * FROM SKILL";
            rs2 = stat.executeQuery(query2);
            if (rs2.next()) {
        %>
<table class="assessment-table">
    <thead>
        <tr>
            <th>Skill Name</th>
            <th>Date Updated</th>
            <th>Skill Level</th>
            <th>Action</th>
        </tr>
    </thead>
    <% 
        while (rs2.next()) {
            String skillName = rs2.getString("skill_name");
    %>
    <tr id="row_<%= skillName %>">
        <td><%= skillName %></td>
        <td><%= rs2.getDate("updated_date") %></td>
        <td><%= rs2.getString("level_skill") %></td>
        <td>
            
            <a href="deleteSkill.jsp?skillName=<%= skillName %>" class="btn">Delete</a>
        </td>
    </tr>
    <% } %>
</table>

        <% 
            } else {
                out.println("No skills found.");
            }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            } finally {
                // Ensure that the connection and statement are closed after use
                try {
                    if (rs2 != null) rs2.close();
                    if (rs != null) rs.close(); // Close rs as well
                    if (stat != null) stat.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
    </div>

    <aside>
        <div class="card">
            <h1>Career Pathway Progress Tracker</h1>
            <div class="progress-container">
                <div class="progress-bar" id="progress-bar"></div>
                <div class="progress-text" id="progress-text"></div>
            </div>
            <form action="SkillUpdateController" method="post">
                <label for="skillName">Skill Name:</label>
                <input type="text" name="skillName" id="skillName" required>
                <label for="levelSkill">Skill Level:</label>
                <select name="levelSkill" id="levelSkill" required>
                    <option value="Beginner">Beginner</option>
                    <option value="Intermediate">Intermediate</option>
                    <option value="Advanced">Advanced</option>
                </select>
                <button type="submit">Update Skill</button>
            </form>
        </div>
    </aside>
</div>

<script>
    function deleteSkill(skillName) {
        if (confirm("Are you sure you want to delete this skill?")) {
            var row = document.getElementById("row_" + skillName);
            if (row) {
                row.parentNode.removeChild(row);
            }
        }
    }
</script>

</body>
</html>
