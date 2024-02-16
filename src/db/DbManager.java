package db;

import models.Item;
import models.User;

import java.sql.ResultSet;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

public class DbManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/postgres?currentSchema=sprint2",
                    "postgres",
                    "meruert1995"
            );
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);

        }
    }

    public static List<Item> getItems() {
        List<Item> items = new ArrayList<>();
        try {
            var statement = connection.prepareStatement(
                    "SELECT * FROM ITEMS"
            );
            var resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getLong("ID"));
                item.setName(resultSet.getString("NAME"));
                item.setDescription(resultSet.getString("DESCRIPTION"));
                item.setPrice(resultSet.getDouble("PRICE"));
                items.add(item);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }
    public static String auth(String email, String password){
        User user = getUserByEmail(email);
        if (user == null){
            return "emailError";
        }
        if (!Objects.equals(user.getPassword(),password)){
            return "passwordError";
        }
        return "success";
    }

    public static User getUserByEmail(String email){
        User user = null;
        try{
          var statement = connection.prepareStatement(
                    "SELECT * FROM USERS " +
                            "WHERE EMAIL = ?"
            );
          statement.setString(1, email);
          var resultSet = statement.executeQuery();
          if (resultSet.next()){
              user = new User();
              user.setId(resultSet.getLong("ID"));
              user.setEmail(email);
              user.setEmail(resultSet.getString("EMAIL"));
              user.setPassword(resultSet.getString("PASSWORD"));
              user.setFullName(resultSet.getString("FULL_NAME"));
          }
          statement.close();

        } catch (Exception e){
            e.printStackTrace();
        }
        return user;

    }
    public static void addTovar(Item item) {
        try {
            var statement = connection.prepareStatement(
                    "INSERT INTO ITEMS (NAME, DESCRIPTION, PRICE) VALUES (?, ?, ?)"
            );
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setDouble(3, item.getPrice());

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Ошибка при добавлении товара в базу данных", e);
        }
    }


}

