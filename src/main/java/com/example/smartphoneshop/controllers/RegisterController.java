package com.example.smartphoneshop.controllers;

import com.example.smartphoneshop.dao.AccountDAO;
import com.example.smartphoneshop.database.MySQLDatabase;
import com.example.smartphoneshop.entities.Account;
import com.example.smartphoneshop.services.AccountService;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterController", value = "/RegisterController")
public class RegisterController extends HttpServlet {
    private final AccountService service = new AccountService(new AccountDAO(new MySQLDatabase()));

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        try {
            if (service.isEmailExist(email)) {
                request.setAttribute("message", "This email already in use");
                request.getRequestDispatcher(request.getContextPath() + "/register").forward(request, response);
            } else {
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String password = request.getParameter("pass");
                String encryptedPassword = DigestUtils.md5Hex(password);
                Account account = new Account(email, encryptedPassword, name, phone);
                service.create(account);
                request.setAttribute("message", "You have successfully registered an account");
                request.getRequestDispatcher("/mail-success.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
