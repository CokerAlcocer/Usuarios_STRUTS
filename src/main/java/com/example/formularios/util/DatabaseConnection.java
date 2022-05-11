package com.example.formularios.util;

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException {
        DriverManager.registerDriver(new Driver());
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/example?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
                "root","root");
    }

    public static void main(String[] args) {
        try {
            Connection con = DatabaseConnection.getConnection();
            System.out.println("Conexión exitosa");
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
