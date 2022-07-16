package com.example.smartphoneshop.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLDatabase {
    private final String host = "localhost:3306";
    private final String name = "smartphone_shop";
    private final String username = "root";
    private final String password = "admin";
    private final String url = "jdbc:mysql://" + host + "/" + name;

    public Connection connect() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
