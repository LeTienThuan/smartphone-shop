package com.example.smartphoneshop.dao;

import com.example.smartphoneshop.database.MySQLDatabase;
import com.example.smartphoneshop.entities.Account;
import lombok.AllArgsConstructor;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
public class AccountDAO {
    private final MySQLDatabase database;


    public List<Account> findAll() throws SQLException {
        Connection connection = database.connect();
        List<Account> customers = new ArrayList<>();
        String sql = "SELECT * FROM account_db";
        try {
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);
            while (result.next()) {
                int id = result.getInt("id");
                String email = result.getString("email");
                String password = result.getString("password");
                String name = result.getString("name");
                Date birth = result.getDate("birth");
                String phone = result.getString("phone");
                String gender = result.getString("gender");
                String address = result.getString("address");
                String role = result.getString("role_account");
                customers.add(new Account(id, email, password, name, birth, phone, gender, address, role));
            }
            return customers;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            connection.close();
        }
        return null;
    }

    public boolean isEmailExist(String email) throws SQLException {
        Connection connection = database.connect();
        String sql = "SELECT * FROM account_db WHERE email = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            connection.close();
        }
        return false;
    }

    public Account findByEmail(String email) throws SQLException {
        Account account = new Account();
        Connection connection = database.connect();
        String sql = "SELECT * FROM account_db WHERE email = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                account.setEmail(result.getString("email"));
                account.setName(result.getString("name"));
                account.setPassword(result.getString("password"));
                account.setRole (result.getString("role_account"));
            }
            return account;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            connection.close();
        }
        return null;
    }

    public void create(Account account) throws SQLException {
        String sql = "INSERT INTO account_db (name, email, phone, password) VALUES (?,?,?,?)";
        try {
            PreparedStatement statement = database.connect().prepareStatement(sql);
            statement.setString(1, account.getName());
            statement.setString(2, account.getEmail());
            statement.setString(3, account.getPhone());
            statement.setString(4, account.getPassword());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

//    public boolean findAccount(String email, String password){
//        Connection connection = database.connect();
//        String sql = "SELECT * FROM account WHERE email = ? AND password = ?";
//
//    }
}
