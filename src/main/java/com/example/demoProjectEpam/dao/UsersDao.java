package com.example.demoProjectEpam.dao;

import com.example.demoProjectEpam.DBManager;
import com.example.demoProjectEpam.entity.Faculty;
import com.example.demoProjectEpam.entity.User;
import com.example.demoProjectEpam.repository.UserRepository;

import javax.naming.NamingException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UsersDao implements UserRepository {
    private static final String LASTNAME = "lastName";
    private static final String FIRSTNAME = "firstName";
    private static final String SURNAME = "surName";
    private static final String EMAIL = "email";
    private static final String CITY = "city";
    private static final String REGION = "region";
    private static final String STUDY_PLACE = "studyPlace";
    private static final String PASSWORD = "password";
    private static final String ROLE = "role";
    private static final String TABLE_NAME = "users";

    private final DBManager dbManager;

    public UsersDao() {
        dbManager = new DBManager();
    }

    public static String cryptWithMD5(String pass){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] passBytes = pass.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
            StringBuffer sb = new StringBuffer();
            for(int i=0;i<digested.length;i++){
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean addUser(Map<String, String[]> parametersMap) {
        String sql = "insert into users values(default,?,?, ?, ?,?,?,?,?,default,default)";

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            cryptWithMD5(PASSWORD);
            System.out.println(PASSWORD);
            int k = 0;
            statement.setString(++k, parametersMap.get(LASTNAME)[0]);
            statement.setString(++k, parametersMap.get(FIRSTNAME)[0]);
            statement.setString(++k, parametersMap.get(SURNAME)[0]);
            statement.setString(++k, parametersMap.get(EMAIL)[0]);
            statement.setString(++k, parametersMap.get(CITY)[0]);
            statement.setString(++k, parametersMap.get(REGION)[0]);
            statement.setString(++k, parametersMap.get(STUDY_PLACE)[0]);
            statement.setString(++k, parametersMap.get(PASSWORD)[0]);

            statement.execute();
            System.out.println(1);

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }



    // Registration validation:
    public boolean checkEmail(String email) {
        String sql = "select * from " + TABLE_NAME + " where email = ?";
        ResultSet resultSet = null;


        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            statement.execute();

            resultSet = statement.getResultSet();

            if (resultSet.next()) {
                return false;
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
        }

        return true;
    }

    public boolean checkCorectEmail(String email) {
        Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean passwordsEquality(String password, String password1) {
        return password.equals(password1);
    }

    public boolean validatePassword(String p1) {
        Pattern pattern = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$");
        Matcher matcher = pattern.matcher(p1);

        return matcher.find();

    }


    public String checkUser(User user) {
        String sql = "select * from users where email = ? and password = ?";

        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.execute();

            resultSet = statement.getResultSet();

            if (resultSet.next()) {
                return resultSet.getString("role");
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
        }

        return null;
    }

    public static void close(AutoCloseable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<User> getUsers() {
        String sql = "select * from users";
        List<User> users = new ArrayList<>();
        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getLong("id"));
                user.setLastName(resultSet.getString("LastName"));
                user.setFirstName(resultSet.getString("FirstName"));
                user.setSurName(resultSet.getString("Surname"));
                user.setEmail(resultSet.getString("email"));
                user.setCity(resultSet.getString("City"));
                user.setRegion(resultSet.getString("Region"));
                user.setStudyPlace(resultSet.getString("Study_Place"));
                user.setBlocked(resultSet.getString("Blocked"));
                user.setRole(resultSet.getString("role"));

                users.add(user);

            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            assert resultSet != null;
            close(resultSet);
        }

        return users;
    }

    public User getUsersById(int id) {
        String sql = "select * from users where id = ?";
        User user = null;
        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setLastName(resultSet.getString("LastName"));
                user.setFirstName(resultSet.getString("FirstName"));
                user.setSurName(resultSet.getString("Surname"));
                user.setEmail(resultSet.getString("email"));
                user.setCity(resultSet.getString("City"));
                user.setRegion(resultSet.getString("Region"));
                user.setStudyPlace(resultSet.getString("Study_Place"));
                user.setBlocked(resultSet.getString("Blocked"));
                user.setRole(resultSet.getString("role"));


            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            assert resultSet != null;
            close(resultSet);
        }

        return user;
    }

    public int getId(String login) {
        String sql = "select id from users where email = ?";
        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, login);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt("id");
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
        }

        return 0;
    }

    public String checkIfUserExist(String login, String password) {
        String sql = "select * from users where email = ? and password = ?";

        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, login);
            statement.setString(2, password);
            statement.execute();

            resultSet = statement.getResultSet();

            if (resultSet.next()) {
                return resultSet.getString(ROLE);
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
        }

        return null;
    }


    public void blockUser(int id) {
        String sql = "update users set blocked = 1 where id = ?";
        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }

    public void unBlockUser(int id) {
        String sql = "update users set blocked = 0 where id = ?";

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            statement.execute();
        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        }
    }

    public String getRole(int id) {
        String sql = "select role from users where id = ?";
        ResultSet resultSet = null;

        try (Connection connection = dbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getString("Role");
            }

        } catch (SQLException | NamingException e) {
            e.printStackTrace();
        } finally {
            close(resultSet);
        }

        return null;
    }
}
