package mx.edu.utez.proyecto_sgcse.model;

import java.io.Serializable;

public class Documento implements Serializable {

    private int id;

    private String nombre;

    private String direccion;

    private int cta_id;

    public Documento() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCta_id() {
        return cta_id;
    }

    public void setCta_id(int cta_id) {
        this.cta_id = cta_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}



