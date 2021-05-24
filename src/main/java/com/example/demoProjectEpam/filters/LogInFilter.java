package com.example.demoProjectEpam.filters;

import com.example.demoProjectEpam.dao.UsersDao;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;


import javax.servlet.http.HttpServletRequest;


@WebFilter(filterName = "LoginFilter", urlPatterns = {"/login"})
public class LogInFilter implements Filter {
    public static final String USER_VALIDATION_ERROR = "invalidUserError";
    public static final String USER_VALIDATION_MESSAGE = "Wrong Password or Login! Please, try again.";
    public static final String JSP_PAGE = "login.jsp";

    private UsersDao userDAO;

    public void init(FilterConfig config) {
        userDAO = new UsersDao();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        if(httpRequest.getMethod().equalsIgnoreCase("POST")) {
            String email = request.getParameter("login");
            String password = request.getParameter("password");

            String userRole = userDAO.checkIfUserExist(email, password);

            if (userRole != null) {
                request.setAttribute("role", userRole);
                chain.doFilter(request, response);
            }
            else {
                request.setAttribute(USER_VALIDATION_ERROR, USER_VALIDATION_MESSAGE);
            }
        }
        RequestDispatcher rd = request.getRequestDispatcher(JSP_PAGE);
        rd.include(request, response);
    }
}
