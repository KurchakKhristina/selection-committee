package com.example.demoProjectEpam.entity;

public class SubjectOnFaculty {
    private long id;
    private long facultyId;
    private long subjectId;

    public SubjectOnFaculty() {
    }

    public SubjectOnFaculty(long id, long facultyId, long subjectId) {
        this.id = id;
        this.facultyId = facultyId;
        this.subjectId = subjectId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(long facultyId) {
        this.facultyId = facultyId;
    }

    public long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(long subjectId) {
        this.subjectId = subjectId;
    }
}
