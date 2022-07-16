package com.example.smartphoneshop.controllers;

import com.example.smartphoneshop.dao.AccountDAO;
import com.example.smartphoneshop.database.MySQLDatabase;
import com.example.smartphoneshop.entities.Account;
import com.example.smartphoneshop.services.AccountService;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class LoginController extends HttpServlet {
    private final AccountService service = new AccountService(new AccountDAO(new MySQLDatabase()));

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        try {
            if (!service.isEmailExist(email)) {
                request.setAttribute("message", "Incorrect email or password");
                request.getRequestDispatcher(request.getContextPath() + "/login").forward(request, response);
            }else {
                Account account = service.findByEmail(email);
                String encryptedPassword = DigestUtils.md5Hex(request.getParameter("pass"));
                if(encryptedPassword.equals(account.getPassword())){
                    HttpSession session = request.getSession();
                    session.setAttribute("email", account.getEmail());
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
