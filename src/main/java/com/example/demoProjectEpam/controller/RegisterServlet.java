package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.MarkDao;
import com.example.demoProjectEpam.dao.SubjectDao;
import com.example.demoProjectEpam.dao.UsersDao;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private UsersDao userDAO;
    private MarkDao markDao;
    private SubjectDao subjectDao;

    @Override
    public void init() {
        userDAO = new UsersDao();
        markDao = new MarkDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        userDAO.addUser(request.getParameterMap());
//        markDao.addMark(request.getParameterMap());


        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/login");
        dispatcher.forward(request, response);
    }
}
