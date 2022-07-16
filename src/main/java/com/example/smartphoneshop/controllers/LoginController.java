package com.example.smartphoneshop.controllers;

import com.example.smartphoneshop.dao.AccountDAO;
import com.example.smartphoneshop.database.MySQLDatabase;
import com.example.smartphoneshop.entities.Account;
import com.example.smartphoneshop.services.AccountService;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    private final AccountService service = new AccountService(new AccountDAO(new MySQLDatabase()));

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        try {
            if (!service.isEmailExist(email)) {
                request.setAttribute("message", "Incorrect email or password");
                request.getRequestDispatcher("/login").forward(request, response);
            } else {
                Account account = service.findByEmail(email);
                String encryptedPassword = DigestUtils.md5Hex(request.getParameter("password"));
                if (encryptedPassword.equals(account.getPassword())) {
                    String isRemember = request.getParameter("remember-me");
                    HttpSession session = request.getSession();
                    session.setAttribute("account", account);

                    if (isRemember != null && isRemember.equals("on")) {
                        Cookie emailCookie = new Cookie("email", email);
                        Cookie passwordCookie = new Cookie("password", request.getParameter("password"));
                        Cookie remember = new Cookie("remember", "1");

                        emailCookie.setMaxAge(60 * 60 * 60);
                        passwordCookie.setMaxAge(60 * 60 * 60);
                        remember.setMaxAge(60 * 60 * 60);

                        response.addCookie(emailCookie);
                        response.addCookie(passwordCookie);
                        response.addCookie(remember);
                    }

                    response.sendRedirect(request.getContextPath());
                } else {
                    request.setAttribute("message", "Incorrect email or password");
                    request.getRequestDispatcher("/login").forward(request, response);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
