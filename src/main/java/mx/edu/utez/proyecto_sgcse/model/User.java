package mx.edu.utez.proyecto_sgcse.model;

import java.io.Serializable;

public class User implements Serializable {
private String email;
private String pwd;
private String rec_code;
private boolean status;

private String rol;
private String name;
private String surname_P;
private String surname_M;


    public User() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getRec_code() {
        return rec_code;
    }

    public void setRec_code(String rec_code) {
        this.rec_code = rec_code;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname_P() {
        return surname_P;
    }

    public void setSurname_P(String surname_P) {
        this.surname_P = surname_P;
    }

    public String getSurname_M() {
        return surname_M;
    }

    public void setSurname_M(String surname_M) {
        this.surname_M = surname_M;
    }
}
