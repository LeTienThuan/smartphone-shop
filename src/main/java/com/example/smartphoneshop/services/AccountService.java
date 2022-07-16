package com.example.smartphoneshop.services;

import com.example.smartphoneshop.dao.AccountDAO;
import com.example.smartphoneshop.entities.Account;
import lombok.AllArgsConstructor;

import java.sql.SQLException;

@AllArgsConstructor
public class AccountService {
    private final AccountDAO dao;

    public boolean isEmailExist(String email) throws SQLException {
        return dao.isEmailExist(email);
    }

    public Account findByEmail(String email) throws SQLException {
        return dao.findByEmail(email);
    }

    public void create(Account account) throws SQLException {
        dao.create(account);
    }
}
