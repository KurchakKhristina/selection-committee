package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.ApplicationDao;
import com.example.demoProjectEpam.dao.UsersDao;
import com.example.demoProjectEpam.entity.Faculty;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserListServlet", value = "/userList")
public class UserListServlet extends HttpServlet {
    private UsersDao usersDao;

    @Override
    public void init() throws ServletException {
        usersDao = new UsersDao();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("user_list",usersDao.getUsers());


        RequestDispatcher dispatcher = request.getRequestDispatcher("UserList.jsp");
        dispatcher.forward(request, response);
    }
}