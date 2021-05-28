package com.example.demoProjectEpam.dao;

import com.example.demoProjectEpam.DBManager;
import com.example.demoProjectEpam.entity.Application;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.Subject;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.example.demoProjectEpam.dao.UsersDao.close;

public class ApplicationDao {
    private final DBManager dbManager;

    public ApplicationDao() {
        dbManager = new DBManager();
    }
    public boolean addApplication(int userId, int facultyId) {
        String sql = "insert into application values(default,?,?)";

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            int k = 0;
            statement.setInt(++k, userId);
            statement.setInt(++k, facultyId);

            statement.execute();
            System.out.println(1);

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public List<Faculty> getAplicationByUserId(int id) {
        String sql = "select faculty.name from application join faculty  on faculty.ID = application.Faculty_id join users  on users.ID = application.User_id where users.ID= ?";
        ResultSet resultSet = null;
        List<Faculty> faculties= new ArrayList<>();

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Faculty faculty = new Faculty();
                faculty.setName(resultSet.getString("name"));

                faculties.add(faculty);

            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }finally {
            close(resultSet);
        }
        return faculties;
    }


    public int getCountAppByFacultyId(int id) {
        String sql ="select COUNT(Faculty_id) from application join faculty  on faculty.ID = application.Faculty_id where faculty.ID=? group by Faculty_id";
        ResultSet resultSet = null;

        try(Connection connection = dbManager.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql))
        {
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt("Faculty_id");
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            assert resultSet != null;
            close(resultSet);
        }

        return 0;
    }

    public boolean checkIfApplicationExist(int userId, int facultyId) {
        String sql = "select * from application where user_id= ? and faculty_id = ?";

        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userId);
            statement.setInt(2, facultyId);
            statement.execute();

            resultSet = statement.getResultSet();

            if (resultSet.next()) {
                return true;
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
        }

        return false;
    }


}
