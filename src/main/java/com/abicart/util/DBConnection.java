package com.abicart.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection{

    private static final String URL="jdbc:h2:~/abicartdb";
    private static final String USER="sa";
    private static final String PASSWORD="";

    public static Connection getConnection(){

        try{
            Class.forName("org.h2.Driver");
            Connection con=DriverManager.getConnection(URL,USER,PASSWORD);
            System.out.println("H2 DATABASE CONNECTED SUCCESSFULLY!");

            return con;
        }
        catch (ClassNotFoundException e){
            System.out.println("H2 DRIVER NOT FOUND!");

            e.printStackTrace();
        }
        catch (SQLException e){
            System.out.println("H2 DATABASE CONNECTION FAILED!");
            e.printStackTrace();
        }
        return null;
    }

}
