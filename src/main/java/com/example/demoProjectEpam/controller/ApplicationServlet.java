package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.ApplicationDao;
import com.example.demoProjectEpam.dao.FacultyDao;
import com.example.demoProjectEpam.dao.MarkDao;
import com.example.demoProjectEpam.dao.UsersDao;
import com.example.demoProjectEpam.entity.Application;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.Subject;
import com.example.demoProjectEpam.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ApplicationServlet", value = "/application")
public class ApplicationServlet extends HttpServlet {
    private UsersDao usersDao;
    private FacultyDao facultyDao;
    private ApplicationDao applicationDao;
    private MarkDao markDao;

    @Override
    public void init() throws ServletException {
        applicationDao = new ApplicationDao();
        usersDao = new UsersDao();
        facultyDao = new FacultyDao();
        markDao = new MarkDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int facultyID = Integer.parseInt(request.getParameter("facultyID"));

        Integer userID = (Integer) session.getAttribute("userID");
        request.setAttribute("temp_user", usersDao.getUsersById(userID));
        request.setAttribute("temp_faculty", facultyDao.getFacultyById(facultyID));
        session.setAttribute("faculty_id", facultyID);
        session.setAttribute("user_id", userID);
        System.out.println("apfid1" + facultyID);

        System.out.println("apUsi1d" + userID);
        List<Subject> subjects = facultyDao.getSubjectOnFacultyBYId(facultyID);
        request.setAttribute("subject_list", subjects);
        System.out.println(subjects);


        request.getRequestDispatcher("/facultyData.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int facultyID = Integer.parseInt(request.getParameter("faculty_id"));

        HttpSession session = request.getSession();

        Integer userID = (Integer) session.getAttribute("userId");

        int subId = Integer.parseInt( request.getParameter("subjectId"));
        request.setAttribute("subjectId", subId);
//
        int examMark = Integer.parseInt(request.getParameter("examMark"));
        request.setAttribute("examMark", examMark);

        int certificateMark = Integer.parseInt(request.getParameter("certificateMark"));
        request.setAttribute("certificateMark", certificateMark);

        applicationDao.addApplication( facultyID, userID);

            markDao.addMark(userID,request.getParameterMap());


        response.sendRedirect("facultyList#faculty");
    }
}
