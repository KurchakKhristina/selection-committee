package com.example.demoProjectEpam.dao;

import com.example.demoProjectEpam.DBManager;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import static com.example.demoProjectEpam.dao.UsersDao.close;

public class MarkDao {
    private final DBManager dbManager;

    public MarkDao() {
        dbManager = new DBManager();
    }
    public boolean addMark(int userId,Map<String, String[]> parametersMap) {
        String sql = "insert into mark values(default,?,?, ?, ?)";

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            int k = 0;
            statement.setString(++k, parametersMap.get("subjectId")[0]);
            statement.setInt(++k, userId);
            statement.setString(++k, parametersMap.get("examMark")[0]);
            statement.setString(++k, parametersMap.get("certificateMark")[0]);

            statement.execute();
            System.out.println("mark insert");

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean addMarksForUser(){
return false;
    }

}
