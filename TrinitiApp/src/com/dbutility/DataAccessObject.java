package com.dbutility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataAccessObject {
	private static Connection connection = null;

    public static Connection getConnection() {
            if (connection != null)
                    return connection;
            else {
            	
           /*---------------MYSQL PROPERTIES--------------*/
            // Store the database URL in a string
            String serverName = "localhost";
            String portNumber = "3306";
            String sid = "userdb";
            String dbUrl = "jdbc:mysql://" + serverName + "/" + sid;
            try {
            Class.forName("com.mysql.jdbc.Driver");
            // set the url, username and password for the database
            connection = DriverManager.getConnection(dbUrl, "system", "system"
            		+ "");
            
            /*------------------Oracle Properties -------------*/
            /*
             *  String serverName = "localhost";
            String portNumber = "1521";
            String sid = "XE";
            String dbUrl = "jdbc:oracle:thin:@" + serverName + ":" + sid;
            try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // set the url, username and password for the database
            connection = DriverManager.getConnection(dbUrl, "system", "system"+ "");
             */
            
            } catch (Exception e) {
                    e.printStackTrace();
            }
            return connection;
    }
    }
}
