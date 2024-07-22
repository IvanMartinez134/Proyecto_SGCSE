package mx.edu.utez.proyecto_sgcse.model;


import java.io.Serializable;

public class User implements Serializable {

    private int id;
    private String nombre;
    private String apll_1;
    private String apll_2;
    private String email;
    private String pwd;
    private int tel;

    private String cody;
    private int cuatri;
    private String grupo;
    private int status;
    private int carrera;
    private String division;
    private int rol;

    private String matri;

    public User() {
    }

    public User(int id, String nombre, String apll_1, String apll_2, String email, String pwd, int tel, String cody, int cuatri, String grupo, int status, int carrera, String division, int rol, String matri) {
        this.id = id;
        this.nombre = nombre;
        this.apll_1 = apll_1;
        this.apll_2 = apll_2;
        this.email = email;
        this.pwd = pwd;
        this.tel = tel;
        this.cody = cody;
        this.cuatri = cuatri;
        this.grupo = grupo;
        this.status = status;
        this.carrera = carrera;
        this.division = division;
        this.rol = rol;
        this.matri = matri;

    }

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {

        return nombre;
    }

    public void setNombre(String nombre) {

        this.nombre = nombre;
    }

    public String getApll_1() {
        return apll_1;
    }

    public void setApll_1(String apll_1) {
        this.apll_1 = apll_1;
    }

    public String getApll_2() {
        return apll_2;
    }

    public void setApll_2(String apll_2) {
        this.apll_2 = apll_2;
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

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public String getCody() {
        return cody;
    }

    public void setCody(String cody) {
        this.cody = cody;
    }

    public int getCuatri() {
        return cuatri;
    }

    public void setCuatri(int cuatri) {
        this.cuatri = cuatri;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCarrera() {
        return carrera;
    }

    public void setCarrera(int carrera) {
        this.carrera = carrera;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public String getMatri() {
        return matri;
    }

    public void setMatri(String matri) {
        this.matri = matri;
    }


}
