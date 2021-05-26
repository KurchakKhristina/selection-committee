package com.example.demoProjectEpam.dao;

import com.example.demoProjectEpam.DBManager;
import com.example.demoProjectEpam.entity.Subject;

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

    /*examMark
    certificateMark*/
    public void addMarks(int userId, Map<String, String[]> parametersMap) {
        for (String s : parametersMap.keySet()) {
            if (!s.equals("faculty_id")) {
                String[] array = s.split("_");
                String table = null;

                if (array[0].equals("examMark")) table = "exammark";
                else if (array[0].equals("certificateMark")) table = "certificatemark";

                String sql = "insert into " + table + " values(default, ?, ?, ?)";

                try (Connection connection = dbManager.getConnection();
                     PreparedStatement statement = connection.prepareStatement(sql)) {

                    int k = 0;
                    statement.setString(++k, array[1]);
                    statement.setInt(++k, userId);
                    statement.setString(++k, parametersMap.get(s)[0]);

                    statement.execute();
                    System.out.println("mark insert");

                } catch (SQLException | NamingException e) {
                    e.printStackTrace();
                }
            }
        }


    }

}
