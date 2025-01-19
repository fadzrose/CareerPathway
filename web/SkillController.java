package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import model.Skill;

public class SkillController extends HttpServlet {

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/SKILL"; 
    private static final String JDBC_USER = "app";  
    private static final String JDBC_PASSWORD = "app";  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the form
        String id = request.getParameter("id");
        String userID = request.getParameter("userID");
        String careerID = request.getParameter("careerID");
        String levelSkill = request.getParameter("levelSkill");
        String Industry = request.getParameter("Industry"); // Get the selected category
        String updatedDateStr = request.getParameter("UpdatedDate");

        // Debugging: Print the updatedDateStr and category to the console or log
        System.out.println("Updated Date: " + updatedDateStr);
        System.out.println("Selected Industry: " + Industry);

        // Validate and convert updatedDate (from dd-MM-yyyy to yyyy-MM-dd)
        java.sql.Date updatedDate = null;
        if (updatedDateStr != null && !updatedDateStr.isEmpty()) {
            try {
                // Convert dd-MM-yyyy to yyyy-MM-dd
                String[] dateParts = updatedDateStr.split("-");
                if (dateParts.length == 3) {
                    String formattedDateStr = dateParts[2] + "-" + dateParts[1] + "-" + dateParts[0];  // yyyy-MM-dd format
                    updatedDate = java.sql.Date.valueOf(formattedDateStr);  // Use the corrected date format
                } else {
                    response.getWriter().write("Invalid date format. Please use dd-MM-yyyy.");
                    return;
                }
            } catch (IllegalArgumentException e) {
                response.getWriter().write("Invalid date format. Please use dd-MM-yyyy.");
                return;
            }
        } else {
            response.getWriter().write("Updated date is required.");
            return;
        }

        // Create the Skill object (add category as a new field if necessary)
        Skill skill = new Skill(id, userID, careerID, levelSkill, Industry, updatedDateStr);

        // Save the skill object to the database
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "INSERT INTO skill (id, userID, careerID, level_skill, Industry, updated_date) VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, skill.getId());
                stmt.setString(2, skill.getUserID());
                stmt.setString(3, skill.getCareerID());
                stmt.setString(4, skill.getLevelSkill());
                stmt.setString(5, Industry);  // Add category to the prepared statement
                stmt.setDate(6, updatedDate);  // Use the valid updatedDate

                // Execute the insert query
                stmt.executeUpdate();
            }

            // Forward to the SkillView.jsp to display the results
            request.setAttribute("skill", skill);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SkillView.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            // Log the exception
            e.printStackTrace();  // Log the full stack trace to debug the issue
            response.getWriter().write("Error saving skill data to database: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("SkillForm.jsp");
        dispatcher.forward(request, response);
    }
}
