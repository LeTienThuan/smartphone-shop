package com.example.smartphoneshop.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Account {
    private int id;
    private String email;
    private String password;
    private String name;
    private Date birth;
    private String phone;
    private String gender;
    private String address;
    private String role;

    public Account(String email, String password, String name, String phone){
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
    }
}

