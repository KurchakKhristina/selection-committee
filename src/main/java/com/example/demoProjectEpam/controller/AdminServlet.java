package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.FacultyDao;
import com.example.demoProjectEpam.dao.UsersDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    private FacultyDao facultyDao;
    private UsersDao usersDao;


    @Override
    public void init() throws ServletException {
        facultyDao = new FacultyDao();
        usersDao = new UsersDao();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("faculty_list", facultyDao.getFaculty());
        request.setAttribute("user_list",usersDao.getUsers());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/welcome_admin.jsp");
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userID = Integer.parseInt((request.getParameter("userID")));
        String isBlocked = request.getParameter("isBlocked");

        switch (isBlocked) {
            case "block":
                usersDao.blockUser(userID);
                response.sendRedirect("admin#users");
                break;
            case "unblock":
                usersDao.unBlockUser(userID);
                response.sendRedirect("admin#users");
                break;

        }
    }
}
