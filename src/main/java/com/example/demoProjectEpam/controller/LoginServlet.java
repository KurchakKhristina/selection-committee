package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.UsersDao;
import com.example.demoProjectEpam.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private UsersDao userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UsersDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("login.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("login");
        int id = userDAO.getId(email);
        boolean blocked = Boolean.parseBoolean(request.getParameter("blocked"));

        String role = userDAO.getRole(id);
        System.out.println(role);

        HttpSession session = request.getSession();
        session.setAttribute("id", session.getId());
        session.setAttribute("username", email);
        session.setAttribute("userId", id);
        session.setAttribute("role", role);
        session.setAttribute("blocked", blocked);

        response.sendRedirect("index.jsp");
    }

}
