package com.example.demoProjectEpam.entity;

public class Faculty {
    private long id;
    private String name;
    private int count_of_places;
    private int count_of_public_places;
    private int count_of_paid_places;
    private String subject1;
    private String subject2;
    private String subject3;
    private String description;
    private String logo;

    public Faculty() {
    }

    public Faculty(long id, String name, int count_of_places, int count_of_public_places, int count_of_paid_places,  String description, String logo) {
        this.id = id;
        this.name = name;
        this.count_of_places = count_of_places;
        this.count_of_public_places = count_of_public_places;
        this.count_of_paid_places = count_of_paid_places;
        this.description = description;
        this.logo = logo;
    }

    public Faculty(String name, int count_of_places, int count_of_public_places, int count_of_paid_places, String description, String logo,long id) {
        this.name = name;
        this.count_of_places = count_of_places;
        this.count_of_public_places = count_of_public_places;
        this.count_of_paid_places = count_of_paid_places;
        this.description = description;
        this.logo = logo;
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount_of_places() {
        return count_of_places;
    }

    public void setCount_of_places(int count_of_places) {
        this.count_of_places = count_of_places;
    }

    public int getCount_of_public_places() {
        return count_of_public_places;
    }

    public void setCount_of_public_places(int count_of_public_places) {
        this.count_of_public_places = count_of_public_places;
    }

    public int getCount_of_paid_places() {
        return count_of_paid_places;
    }

    public void setCount_of_paid_places(int count_of_paid_places) {
        this.count_of_paid_places = count_of_paid_places;
    }

    public String getSubject1() {
        return subject1;
    }

    public void setSubject1(String subject1) {
        this.subject1 = subject1;
    }

    public String getSubject2() {
        return subject2;
    }

    public void setSubject2(String subject2) {
        this.subject2 = subject2;
    }

    public String getSubject3() {
        return subject3;
    }

    public void setSubject3(String subject3) {
        this.subject3 = subject3;
    }
}
