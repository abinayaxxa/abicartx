package com.abicart.util;

public class GeneratePassword{
    public static void main(String[] args){
        String password = "Admin@123";

        String hashedPassword = PasswordUtil.hashPassword(password);

        System.out.println(hashedPassword);
    }
}
