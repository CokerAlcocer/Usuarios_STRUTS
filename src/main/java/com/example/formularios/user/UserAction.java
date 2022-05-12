package com.example.formularios.user;

import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;

public class UserAction extends ActionSupport {
    // Para usar las variables en struts deben ser String
    private String nombre, apPaterno, apMaterno, direccion, telefono;
    private int operation = 0;
    private ArrayList<User> users;
    private String idRem;

    // --- Metodos de operacion ---

    public String getAllUsers() {
        DaoUser du = new DaoUser();
        users = du.findAllUsers();
        return SUCCESS;
    }

    public String deleteUser() {
        DaoUser du = new DaoUser();
        int id;
        try{
            id = Integer.parseInt(idRem);
            if(!du.deleteUser(id)){
                return ERROR;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        getAllUsers();
        return SUCCESS;
    }

    public String addUser() {
        DaoUser du = new DaoUser();
        operation = 0;
        String aNombre, aApPaterno, aApMaterno, aDireccion, aTelefono;

        aNombre = nombre;
        aApPaterno = apPaterno;
        aApMaterno = apMaterno;
        aDireccion = direccion;
        aTelefono = telefono;

        User u = new User(aNombre, aApPaterno, aApMaterno, aDireccion, aTelefono);
        if(du.addUser(u)){
            operation = 1;
        }else{
            operation = 3;
            return ERROR;
        }

        getAllUsers();
        return SUCCESS;
    }

    // --- Getters and Setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getOperation() {
        return operation;
    }

    public void setOperation(int operation) {
        this.operation = operation;
    }

    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }

    public String getIdRem() {
        return idRem;
    }

    public void setIdRem(String idRem) {
        this.idRem = idRem;
    }
}
