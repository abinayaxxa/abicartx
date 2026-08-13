package com.abicart.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection{

    private static final HikariDataSource dataSource;

    static{
        HikariConfig config=new HikariConfig();

        String dbUrl = System.getenv("DB_URL");
        String dbUsername = System.getenv("DB_USERNAME");
        String dbPassword = System.getenv("DB_PASSWORD");

        if (dbUrl==null || dbUrl.isBlank()){
            dbUrl="jdbc:h2:~/abicartdb";
            dbUsername="sa";
            dbPassword="";
        }
        config.setJdbcUrl(dbUrl);
        config.setDriverClassName("org.h2.Driver");
        config.setUsername(dbUsername != null ? dbUsername : "sa");
        config.setPassword(dbPassword != null ? dbPassword : "");
        
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(2);
        config.setConnectionTimeout(30000);
        config.setIdleTimeout(600000);
        config.setMaxLifetime(1800000);

        dataSource=new HikariDataSource(config);
        System.out.println("DATABASE CONNECTION POOL CREATED SUCCESSFULLY!");
        System.out.println("Database URL: " + dbUrl);

    }

    private DBConnection(){
    }
    public static Connection getConnection() throws SQLException{
        return dataSource.getConnection();
    }

    public static void closePool(){
        if(dataSource != null && !dataSource.isClosed()){
            dataSource.close();
            System.out.println("DATABASE CONNECTION POOL CLOSED.");
        }
    }

}
