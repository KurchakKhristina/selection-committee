package com.example.demoProjectEpam.dao;

import com.example.demoProjectEpam.DBManager;
import com.example.demoProjectEpam.entity.Subject;

import javax.naming.NamingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.example.demoProjectEpam.dao.UsersDao.close;

public class SubjectDao {
    private final DBManager dbManager;
    public SubjectDao(){
        this.dbManager=new DBManager();
    }

    public Subject getSubIdByName(String name) {
        String sql ="select * from subject where name = ? ";
        ResultSet resultSet = null;
        Subject subject = null;
        try(Connection connection = dbManager.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1,name);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                subject = new Subject();
                subject.setName(resultSet.getString("name"));
                subject.setId(resultSet.getInt("id"));
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            assert resultSet != null;
            close(resultSet);
        }

        return subject;
    }
    public List<Subject> getSubject()  {
        String sql = "select * from subject" ;
        List<Subject> subjects = new ArrayList<>();
        ResultSet resultSet = null;

        try(Connection connection = dbManager.getConnection();
            Statement statement = connection.createStatement()) {

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Subject subject = new Subject();
                subject.setId(resultSet.getLong("id"));
                subject.setName(resultSet.getString("name"));

                subjects.add(subject);

            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            assert resultSet != null;
            close(resultSet);
        }

        return subjects;
    }
}
