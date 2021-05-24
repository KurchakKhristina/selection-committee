package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.ApplicationDao;
import com.example.demoProjectEpam.dao.UsersDao;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserCabinetServlet", value = "/myCabinetServlet")
public class UserCabinetServlet extends HttpServlet {
    private UsersDao usersDao;
    private ApplicationDao applicationDao;

    @Override
    public void init() throws ServletException {
        usersDao = new UsersDao();
        applicationDao = new ApplicationDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Integer userID = (Integer) session.getAttribute("userId");
        System.out.println(userID);
        request.setAttribute("userId",userID);
//        session.setAttribute("id", session.getId());

        User user = usersDao.getUsersById(userID);
        request.setAttribute("temp_u", user);

        List<Faculty> faculty = applicationDao.getAplicationByUserId(userID);
        for (Faculty faculty1 : faculty) {
            System.out.println(String.valueOf(faculty1.toString()));
        }
        request.setAttribute("f_tamp", faculty);



        request.getRequestDispatcher("UserCabinet.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
