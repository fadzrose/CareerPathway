package model;

public class Skill {

    private String id;
    private String userID;
    private String careerID;
    private String levelSkill;
    private String Industry;  // New field for category
    private String updatedDate;

    // Constructor with all necessary parameters, including category
    public Skill(String id, String userID, String careerID, String levelSkill, String Industry, String updatedDate) {
        this.id = id;
        this.userID = userID;
        this.careerID = careerID;
        this.levelSkill = levelSkill;
        this.Industry = Industry;  // Initialize category
        this.updatedDate = updatedDate;
    }

    // Getters and setters for all fields
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCareerID() {
        return careerID;
    }

    public void setCareerID(String careerID) {
        this.careerID = careerID;
    }

    public String getLevelSkill() {
        return levelSkill;
    }

    public void setLevelSkill(String levelSkill) {
        this.levelSkill = levelSkill;
    }

    public String getIndustry() {
        return Industry;  // Getter for category
    }

    public void setIndustry(String Industry) {
        this.Industry = Industry;  // Setter for category
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
}
