package com.example.demoProjectEpam.controller;

import com.example.demoProjectEpam.dao.ApplicationDao;
import com.example.demoProjectEpam.dao.FacultyDao;
import com.example.demoProjectEpam.dao.UsersDao;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "FacultyListServlet", value = "/facultyList")
public class FacultyListServlet extends HttpServlet {
    private FacultyDao facultyDao;
    private UsersDao usersDao;


    @Override
    public void init() throws ServletException {
        facultyDao = new FacultyDao();
        usersDao = new UsersDao();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userId");
//
//        String sort = request.getParameter("sort");
//        String order = request.getParameter("order");
//        request.setAttribute("sort_param", sort);
//        request.setAttribute("order_param", order);
//
        int startPage = Integer.parseInt(request.getParameter("page"));
        int start = (startPage - 1) * FacultyDao.LIMIT;
        int pages = 2;
        request.setAttribute("pages", pages);
        request.setAttribute("faculty_list", facultyDao.getFaculty(start));
        request.setAttribute("user_list",usersDao.getUsersById(userID));


        RequestDispatcher dispatcher = request.getRequestDispatcher("welcom_user.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {

            case "delete":
                deleteUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            case "add":
                facultyDao.addFaculty(request.getParameterMap());
                response.sendRedirect("admin");
                break;
            default:
                response.sendRedirect("admin");
                break;
        }
    }


    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String name = request.getParameter("name");
        System.out.println(name);
        int countOfPlace = Integer.parseInt(request.getParameter("count_of_places"));
        System.out.println("co " + countOfPlace);
        int countOfPublicPlace = Integer.parseInt(request.getParameter("count_of_public_places"));
        System.out.println("co " + countOfPublicPlace);
        int countOfPaidPlace = Integer.parseInt(request.getParameter("count_of_paid_places"));
        System.out.println("co " + countOfPaidPlace);

        String decription = request.getParameter("description");
        System.out.println("co " + decription);

        String logo = request.getParameter("logo");
        int id = Integer.parseInt(request.getParameter("facultyID"));
        System.out.println("id" + id);
        Faculty updateFaculty = new Faculty(name, countOfPlace, countOfPublicPlace, countOfPaidPlace, decription, logo, id);
        facultyDao.updateFaculty(updateFaculty);
        response.sendRedirect("admin");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("facultyID"));
        facultyDao.deleteFacultyById(id);
        response.sendRedirect("admin");
    }
}

