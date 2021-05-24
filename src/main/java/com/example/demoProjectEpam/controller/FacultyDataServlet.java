package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.FacultyDao;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.Subject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SubjectListServlet", value = "/facultyInfo")
public class FacultyDataServlet extends HttpServlet {
    FacultyDao facultyDao;

    @Override
    public void init() throws ServletException {
        facultyDao = new FacultyDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int facultyID = Integer.parseInt(request.getParameter("facultyID"));
        System.out.println("*" + facultyID);
        session.setAttribute("id", session.getId());


        Faculty faculty = facultyDao.getFacultyById(facultyID);
        request.setAttribute("temp_faculty", faculty);

        List<Subject> subjects = facultyDao.getSubjectOnFacultyBYId(facultyID);
        request.setAttribute("subject_list", subjects);
        System.out.println(subjects);
        RequestDispatcher dispatcher = request.getRequestDispatcher("facultyData.jsp");
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}