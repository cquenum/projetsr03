/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mutamba.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author cquenum
 */
public class MysqlConnection {

    /*
    You have successfully created a new MySQL database. 
    Your details can be found below.

    Username: mVklwn0hfR 
    Database: mVklwn0hfR 
    Password: uXJtB5yTtB 
    Server: remotemysql.com 
    Port: 3306 
    
     */
    /**
     * URL de connection
     */
    private static final String url = "jdbc:mysql://remotemysql.com:3306/mVklwn0hfR?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
    /**
     * Nom du user
     */
    private static final String user = "mVklwn0hfR";
    /**
     * Mot de passe du user
     */
    private static final String passwd = "uXJtB5yTtB";
    /**
     * Objet Connection
     */
    private static Connection connect;

    /**
     * Méthode qui va nous retourner notre instance et la créer si elle n'existe
     * pas...
     *
     * @return
     */
    public static Connection getInstance() {
        if (connect == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connect = DriverManager.getConnection(url, user, passwd);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return connect;
    }
}
