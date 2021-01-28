/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jdbc.utility;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author nurfa
 */
public class JDBCUtility {
    private static Connection con = null;
    
//               String dbName = "Q5XZNrd9uF";
//               String url = "jdbc:mysql://remotemysql.com:3306/" + dbName + "?";
//               String userName = "Q5XZNrd9uF";
//               String password = "KsH8OJBw10";

    private static final String DB_NAME = "ainalfa_alumni_module-db";
    private static final String HOST = "johnny.heliohost.org";
    private static final String PORT = "3306";
    private static final String[] USERNAMES = {
            "ainalfa_ainal",
            "ainalfa_ainal2",
            "ainalfa_ainal3",
            "ainalfa_ainal4"
        };
    private static final String[] PASSWORDS = {
            "ainal@123",
            "ainal2@123",
            "ainal3@123",
            "ainal4@123"
        };
               
//                String dbName = "alumni_module-db";
//                String host = "localhost";
//                String port = "3307";
//                String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
//                String userName = "root";
//                String password = "";
               
//                String dbName = "alumni_module-db";
//                String host = "localhost";
//                String port = "3307";
//                String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
//                String userName = "root";
//                String password = "";
        
    public static Connection getCon() {
        try {
            if(con == null || con.isClosed()) {
                con = createConnection();
            }
        } catch (SQLException ex) {
            Logger.getLogger(JDBCUtility.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return con;
    }
    
    public static Connection createConnection() {
        Connection con = null;
        int i = 0;
        
        while(true) {
            try {
                String url = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME + "?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
                String driver = "com.mysql.jdbc.Driver";

                Class.forName (driver);
                con = DriverManager.getConnection(url, USERNAMES[i], PASSWORDS[i]);
                DatabaseMetaData dma = con.getMetaData ();
                System.out.println("\nConnected to " + dma.getURL());
                System.out.println("Driver       " + dma.getDriverName());
                System.out.println("Version      " + dma.getDriverVersion());
                System.out.println("");
                
                break;
            }
            catch (SQLException ex) {
                while (ex != null)
                {
                    System.out.println ("SQLState: " +
                                        ex.getSQLState ());
                    System.out.println ("Message:  " +
                                        ex.getMessage ());
                    System.out.println ("Vendor:   " +
                                        ex.getErrorCode ());
                    ex = ex.getNextException ();
                    System.out.println ("");
                }
                
                if(i + 1 == USERNAMES.length || i + 1 > USERNAMES.length) {
                    System.out.println("Connection to the database error");
                    break;
                }
                else i++;

            }
            catch (ClassNotFoundException ex) {
                System.out.println(ex);
                System.out.println("JDBC Connector not found");
                break;
            }
        }
        
        return con; 
 }
    public static void jdbcConClose() {
	JDBCUtility.con = null;
    }
}
