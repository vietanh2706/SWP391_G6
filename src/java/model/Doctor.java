package model;

public class Doctor {

    private User user;
    private int id;
    private int dept_id;
    private int room_number;
    private String exp_year;
    private String description;
    

    public Doctor() {
    }

    public Doctor(User user, int id, int dept_id, int room_number, String exp_year, String description) {
        this.user = user;
        this.id = id;
        this.dept_id = dept_id;
        this.room_number = room_number;
        this.exp_year = exp_year;
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public String getExp_year() {
        return exp_year;
    }

    public void setExp_year(String exp_year) {
        this.exp_year = exp_year;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Doctor{" + "user=" + user + ", id=" + id + ", dept_id=" + dept_id + ", room_number=" + room_number + ", exp_year=" + exp_year + ", description=" + description + '}';
    }

}
