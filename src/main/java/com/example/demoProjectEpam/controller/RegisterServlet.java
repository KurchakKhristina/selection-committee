package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.MarkDao;
import com.example.demoProjectEpam.dao.SubjectDao;
import com.example.demoProjectEpam.dao.UsersDao;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private UsersDao userDAO;

    @Override
    public void init() {
        userDAO = new UsersDao();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("registration.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Map<String, String[]> parametersMap = request.getParameterMap();
        for (String s : parametersMap.keySet()) {
            System.out.println(s+ ": " + parametersMap.get(s)[0]);
        }

        userDAO.addUser(request.getParameterMap());



        ServletContext servletContext = getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/login");
        dispatcher.forward(request, response);
    }
}
