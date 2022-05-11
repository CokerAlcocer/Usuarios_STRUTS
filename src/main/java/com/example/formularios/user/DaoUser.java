package com.example.formularios.user;

import com.example.formularios.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;

public class DaoUser {
    Connection con;
    PreparedStatement pstm;
    Statement stm;
    ResultSet rs;

    public ArrayList<User> findAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {
            con = DatabaseConnection.getConnection();
            String query = "SELECT * FROM user";
            stm = con.createStatement();
            rs = stm.executeQuery(query);
            while(rs.next()){
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setApPaterno(rs.getString("ap_paterno"));
                u.setApMaterno(rs.getString("ap_materno"));
                u.setDireccion(rs.getString("direccion"));
                u.setTelefono(rs.getString("telefono"));

                users.add(u);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConnection();
        }

        return users;
    }

    public boolean addUser (User u){
        boolean state = false;
        try {
            con = DatabaseConnection.getConnection();
            String query = "INSERT INTO user(nombre, ap_paterno, ap_materno, direccion, telefono) VALUES (?,?,?,?,?)";
            pstm = con.prepareStatement(query);
            pstm.setString(1, u.getNombre());
            pstm.setString(2, u.getApPaterno());
            pstm.setString(3, u.getApMaterno());
            pstm.setString(4, u.getDireccion());
            pstm.setString(5, u.getTelefono());
            state = pstm.executeUpdate() == 1;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection();
        }
        return state;
    }

    public void closeConnection() {
        try {
            if (con != null) {
                con.close();
            }
            if (pstm != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
