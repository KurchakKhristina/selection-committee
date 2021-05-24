package com.example.demoProjectEpam.entity;

public class Application {
    private long id;
    private long user_id;
    private long faculty_id;

    public Application() {
    }

    public Application(long id, long user_id, long faculty_id) {
        this.id = id;
        this.user_id = user_id;
        this.faculty_id = faculty_id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public long getFaculty_id() {
        return faculty_id;
    }

    public void setFaculty_id(long faculty_id) {
        this.faculty_id = faculty_id;
    }
}
