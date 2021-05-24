package com.example.demoProjectEpam.entity;

public class Mark {
    private long id;
    private long userId;
    private long subjectId;
    private int examMark;
    private int certificateMark;

    public Mark() {
    }

    public Mark(long id, long userId, long subjectId, int examMark, int certificateMark) {
        this.id = id;
        this.userId = userId;
        this.subjectId = subjectId;
        this.examMark = examMark;
        this.certificateMark = certificateMark;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(long subjectId) {
        this.subjectId = subjectId;
    }

    public int getExamMark() {
        return examMark;
    }

    public void setExamMark(int examMark) {
        this.examMark = examMark;
    }

    public int getCertificateMark() {
        return certificateMark;
    }

    public void setCertificateMark(int certificateMark) {
        this.certificateMark = certificateMark;
    }
}
