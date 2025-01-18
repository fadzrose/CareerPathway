<html>
<head>
    <title>Skill Assessment</title>
</head>
<body>
    <h1>Enter your skill information</h1>
    <form action="submitSkill" method="post">
        <!-- Existing Skill Name and Level Fields -->
        <label for="skillName">Skill Name:</label>
        <input type="text" id="skillName" name="skillName" required><br><br>

    

        <!-- New Fields -->
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br><br>

        <label for="usedID">User ID:</label>
        <input type="text" id="userID" name="userID" required><br><br>

        <label for="careerID">Career ID:</label>
        <input type="text" id="careerID" name="careerID" required><br><br>

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
</body>
</html>
