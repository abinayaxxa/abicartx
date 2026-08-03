package com.abicart.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection{

    private static final String URL="jdbc:h2:~/abicartdb";
    private static final String USER="sa";
    private static final String PASSWORD="";

    public static Connection getConnection(){

        Connection con=null;

        try{
            Class.forName("org.h2.Driver");
            con=DriverManager.getConnection(URL,USER,PASSWORD);
        }
        catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return con;
    }

}
