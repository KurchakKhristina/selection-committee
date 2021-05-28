package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.ApplicationDao;
import com.example.demoProjectEpam.dao.UsersDao;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.Subject;
import com.example.demoProjectEpam.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserDataServlet", value = "/UserInfo")
public class UserDataServlet extends HttpServlet {
    private UsersDao usersDao;
    private ApplicationDao applicationDao;

    @Override
    public void init() throws ServletException {
        usersDao = new UsersDao();
        applicationDao = new ApplicationDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userId"));
        System.out.println(userID);

        List<Faculty> faculty = applicationDao.getAplicationByUserId(userID);
        for (Faculty faculty1 : faculty) {
            System.out.println((faculty1));
        }
        request.setAttribute("f_temp", faculty);

        User user = usersDao.getUsersById(userID);
        request.setAttribute("temp_user", user);
        request.getRequestDispatcher("userData.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
