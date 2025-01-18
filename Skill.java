package model;

public class Skill {

    private String id;
    private String userID;
    private String careerID;
    private String levelSkill;
    private String updatedDate;

    // Constructor with all necessary parameters
    public Skill(String id, String userID, String careerID, String levelSkill, String updatedDate) {
        this.id = id;
        this.userID = userID;
        this.careerID = careerID;
        this.levelSkill = levelSkill;
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

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
}
