package mx.edu.utez.proyecto_sgcse.model;

import java.io.Serializable;

public class Carrera implements Serializable {
    int id;
    String nombre;
    String division;

    public Carrera() {
    }

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

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }
}
