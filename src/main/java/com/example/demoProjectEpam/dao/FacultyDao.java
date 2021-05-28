package com.example.demoProjectEpam.dao;

import com.example.demoProjectEpam.DBManager;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.Subject;

import javax.naming.NamingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.example.demoProjectEpam.dao.UsersDao.close;

public class FacultyDao {
    private static final String TABLE_NAME = "Faculty";
    public static final int LIMIT = 5;
    private final DBManager dbManager;

    public FacultyDao() {
        dbManager = new DBManager();
    }

    public List<Faculty> getFaculty(int start ) {
        String sql = "select * from " + TABLE_NAME
                + " limit ?" + LIMIT;
//        + " where 1=1 "+ "order by " + sort + " " + order;
        List<Faculty> faculties = new ArrayList<>();
        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, start);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Faculty faculty = new Faculty();
                faculty.setId(resultSet.getInt("id"));
                faculty.setName(resultSet.getString("name"));
                faculty.setCount_of_places(resultSet.getInt("Count_of_place"));
                faculty.setCount_of_paid_places(resultSet.getInt("Count_of_paid_place"));
                faculty.setCount_of_public_places(resultSet.getInt("Count_of_public_place"));
                faculty.setDescription(resultSet.getString("description"));
                faculty.setLogo(resultSet.getString("ImgLogo"));

                faculties.add(faculty);

            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            assert resultSet != null;
            close(resultSet);
        }

        return faculties;
    }

    public Faculty getFacultyById(int id) {
        String sql = "select * from faculty where id = ?";
        ResultSet resultSet = null;
        Faculty faculty = null;
        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                faculty = new Faculty();
                faculty.setId(resultSet.getInt("id"));
                faculty.setName(resultSet.getString("name"));
                faculty.setCount_of_places(resultSet.getInt("Count_of_place"));
                faculty.setCount_of_paid_places(resultSet.getInt("Count_of_paid_place"));
                faculty.setCount_of_public_places(resultSet.getInt("Count_of_public_place"));
                faculty.setDescription(resultSet.getString("description"));
                faculty.setLogo(resultSet.getString("ImgLogo"));
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            assert resultSet != null;
            close(resultSet);
        }

        return faculty;
    }

    public void deleteFacultyById(int id) {
        String sql = "delete from faculty where id = ?";
        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }



    public boolean updateFaculty(Faculty faculty) {
        String sql = "update faculty set name=?, count_of_place=?,count_of_public_place=?,count_of_paid_place=?, description=?, ImgLogo=? where id = ?";
        boolean rowDelete = false;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1,faculty.getName());
            statement.setInt(2,faculty.getCount_of_places());;
            statement.setInt(3,faculty.getCount_of_public_places());
            statement.setInt(4,faculty.getCount_of_paid_places());
            statement.setString(5,faculty.getDescription());
            statement.setString(6,faculty.getLogo());
            statement.setLong(7, faculty.getId());
            rowDelete = statement.executeUpdate() > 0;

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }

        return rowDelete;
    }


    public List<Subject> getSubjectOnFacultyBYId(int id) {
        String sql = "select  subject.Name, subject.ID from subject_on_faculty join subject  on Subject_id = subject.ID join faculty  on Faculty_id  = faculty.ID  where Faculty_id = ?";
        ResultSet resultSet = null;
        List<Subject> subjects = new ArrayList<>();

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Subject subject = new Subject();

                subject.setId(resultSet.getInt("id"));
                subject.setName(resultSet.getString("name"));

                subjects.add(subject);

            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
        }
        return subjects;
    }


    public boolean addFaculty(Map<String, String[]> parametersMap) {
        String sql = "insert into faculty values(default, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            int k = 0;
            statement.setString(++k, parametersMap.get("Name")[0]);
            statement.setInt(++k, Integer.parseInt(parametersMap.get("Count_of_places")[0]));
            statement.setInt(++k, Integer.parseInt(parametersMap.get("Count_of_public_places")[0]));
            statement.setInt(++k, Integer.parseInt(parametersMap.get("Count_of_paid_places")[0]));
            statement.setString(++k, parametersMap.get("Description")[0]);
            statement.setString(++k, parametersMap.get("ImgLogo")[0]);

            statement.execute();
            System.out.println(1);

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
