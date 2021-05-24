package com.example.demoProjectEpam.filters;



import com.example.demoProjectEpam.dao.UsersDao;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter(filterName = "RegisterFilter", urlPatterns = {"/register"})
public class RegisterFilter implements Filter {
    private static final String EMAIL = "email";
    private static final String PASSWORD = "password";
    private static final String CONFIRMED_PASSWORD = "password1";

    public static final String EMAIL_VALIDATION_ERROR = "emailError";
    public static final String EMAIL_VALIDATION_MESSAGE = "This email is already taken!";
    public static final String EMAIL_VALIDATION_MESSAGE2 = "This email is incorrect!";
    public static final String PASSWORD_EQUALITY_ERROR = "passwordEqualityError";
    public static final String PASSWORD_EQUALITY_MESSAGE = "Passwords should be equals!";
    public static final String PASSWORD_VALIDATION_ERROR = "passwordValidationError";
    public static final String PASSWORD_VALIDATION_MESSAGE = "Password should be minimum 8 characters, at least one letter and one number!";

    private UsersDao userDAO;

    public void init(FilterConfig config) {
        userDAO = new UsersDao();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        String email = request.getParameter(EMAIL);
        String password = request.getParameter(PASSWORD);
        String password1 = request.getParameter(CONFIRMED_PASSWORD);

        boolean passwordsEquality = userDAO.passwordsEquality(password, password1);
        boolean passwordValidation = userDAO.validatePassword(password);
        boolean loginValidation = userDAO.checkEmail(email);
        boolean loginValidatorforCorectValue = userDAO.checkCorectEmail(email);

        if (passwordsEquality && passwordValidation && loginValidation && loginValidatorforCorectValue) {
            chain.doFilter(request, response);
        }

        if (!loginValidation) request.setAttribute(EMAIL_VALIDATION_ERROR, EMAIL_VALIDATION_MESSAGE);
        else if (!loginValidatorforCorectValue) request.setAttribute(EMAIL_VALIDATION_ERROR, EMAIL_VALIDATION_MESSAGE2);
        else if (!passwordsEquality) request.setAttribute(PASSWORD_EQUALITY_ERROR, PASSWORD_EQUALITY_MESSAGE);
        else if (!passwordValidation) request.setAttribute(PASSWORD_VALIDATION_ERROR, PASSWORD_VALIDATION_MESSAGE);

        RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
        rd.include(request, response);

    }
}
