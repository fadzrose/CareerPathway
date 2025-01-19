<%-- 
    Document   : CareerEngine
    Created on : Jan 16, 2025, 11:06:29 AM
    Author     : fadzillah
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Career Recommendation Engine</title>
    <style>
        body, h1, h2, p  {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            justify-content: center;
        }

        header {
            background-color: #639AAF;
            color: white;
            padding: 15px;
        
            text-align: center;
            position: fixed;
            top: 0;
            width: 100%;
        }

        /* Sidebar Styles */
        .sidebar {
        width: 200px;
        height: 100vh;
        background-color: #78B3CE;
        color: #fff;
        position: fixed;
        padding: 20px;
        margin-top: -34px;
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
        .container {
            margin: 20px auto;
            margin-top: 100px;
            margin-left: 250px;
            max-width: 1200px;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            
        }

        .career-card {
            display: flex;
            max-width: 800px;
            justify-content: space-between;
            align-items: center;
            background: #eaf4ff;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            flex-wrap: wrap; /* Allows content to wrap on smaller screens */
        }

        .career-details {
            flex: 2;
            min-width: 200px; 
            margin-bottom: 10px;
        }

        .career-actions {
            text-align: right;
            min-width: 150px; /* Sets a minimum width for the buttons container */
            display: flex;
            flex-wrap: wrap; /* Allows buttons to stack when space is limited */
            gap: 10px; /* Adds space between buttons */
            justify-content: flex-end; /* Aligns buttons to the right */
        }

        .career-actions .btn {
            padding: 10px 20px;
            background-color: #0077cc;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            display: block; /* Ensures buttons take up full width when stacked */
            width: fit-content; /* Ensures buttons are sized based on content by default */
            white-space: nowrap; /* Prevents text wrapping within buttons */
        }

        .career-actions .btn:hover {
            background-color: #0056b3; /* Adds a hover effect for better UX */
        }

        @media (max-width: 768px) { /* Adjusts layout for smaller screens */
            .career-card {
                flex-direction: column; /* Stacks content vertically */
                align-items: flex-start; /* Aligns content to the left */
            }

            .career-actions {
                text-align: left;
                justify-content: flex-start; /* Align buttons to the left */
            }

            .career-actions .btn {
                width: 100%; /* Makes buttons full-width on small screens */
            }
        }


        .btn {
            text-decoration: none;
            padding: 10px 15px;
            background-color: #0077cc;
            color: white;
            border-radius: 5px;
            font-size: 14px;
            
        }

        .btn:hover {
            background-color: #005fa3;
        }

        .filter-section {
            margin-bottom: 20px;
        }

        .filter-section input,
        .filter-section select {
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
    </head>
    <body>
        <%
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");

                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/CareerPathway", "app","app");
                Statement stat = conn.createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                ResultSet.CONCUR_READ_ONLY
                );
                
                String industry = request.getParameter("industry");
                String search = request.getParameter("search");
                // Build SQL query dynamically
                String query = "SELECT * FROM CAREER WHERE 1=1"; // Base query

                // Add filter condition if provided
                if (industry != null && !industry.isEmpty()) {
                    query += " AND industry = '" + industry + "'";
                }
                if (search != null && !search.trim().isEmpty()) {
                    query += " AND position LIKE '%" + search + "%'";
                }
                //String str = "Select * from CAREER";
                ResultSet rs = stat.executeQuery(query);
                
                %>
        
    <header>
        <h1>Career Recommendation Engine</h1>
        
    </header>
    <div class="sidebar">
        <h2>Career Pathway</h2>
        <ul>
            <li><a href="dashboard.html">Dashboard</a></li>
            <li><a href="Skill.html">Skills</a></li>
            <li><a href="recommendation.html">Career</a></li>
            <li><a href="progress.html">Progress</a></li>
        </ul>
    </div>
    
    <div class="container">
        <!-- Filters -->
        <div class="filter-section">
            
            <form method="GET" action="CareerEngine.jsp">
                <input type="text" name="search" placeholder="Search careers...">
                <select name="industry">
                    <option value="">Filter by Industry</option>
                    <option value="Technology" <%= "Technology".equals(request.getParameter("industry")) ? "selected" : "" %>>Technology</option>
                    <option value="Healthcare" <%= "Healthcare".equals(request.getParameter("industry")) ? "selected" : "" %>>Healthcare</option>
                    <option value="Engineering" <%= "Engineering".equals(request.getParameter("industry")) ? "selected" : "" %>>Engineering</option>
                    <option value="Construction" <%= "Construction".equals(request.getParameter("industry")) ? "selected" : "" %>>Construction</option>
                    <option value="Human Recourses" <%= "Human Recourses".equals(request.getParameter("industry")) ? "selected" : "" %>>Human Recourses</option>
                    <option value="Creative" <%= "Creative".equals(request.getParameter("industry")) ? "selected" : "" %>>Creative</option>
                    <option value="Marketing" <%= "Marketing".equals(request.getParameter("industry")) ? "selected" : "" %>>Marketing</option>
                    <option value="Finance" <%= "Finance".equals(request.getParameter("industry")) ? "selected" : "" %>>Finance</option>
                    <option value="Science" <%= "Science".equals(request.getParameter("industry")) ? "selected" : "" %>>Science</option>
                </select>
                <button class="btn" type="submit">Apply Filters</button>
            </form>
        </div>

        <!-- Career Recommendation List -->
        
                <%
                    if (!rs.isBeforeFirst()) {
                    out.println("No careers found.");
                } else {
                while (rs.next()){//start loop
                    String level;
                    Integer phase =rs.getInt("Phase_level");
                    if ( phase ==1){
                        level = "Entry-Level";
                    }else if ( phase ==2){
                        level = "Mid-Level";
                    }else if ( phase ==3){
                        level = "Advanced-Level";
                    }else{
                        level = "Not Defined";
                    }
                %>
        <div class="career-card">
            <div class="career-details">
                
                <h2><%=rs.getString("position")%></h2>
                <p><strong>Phase Level:</strong> <%=level%></p>
                <p><%=rs.getString("description")%></p>
            </div>
            <div class="career-actions">
                <a href="#" class="btn">View Details</a>
                <a href="#" class="btn">Explore Resources</a>
            </div>
        </div>
                <%  }//end data retrieve loop
                    }//end else (not empty)
                %>
    </div>
                <% 
            }catch (Exception e){
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            }
        %>
    </body>
</html>
