package mx.edu.utez.proyecto_sgcse.model;

import java.io.Serializable;

public class Tramite implements Serializable {

    private  int id;

    private String descripcion;

    private double costo;

    private int tiempo_entrega;

    private int tramites_realizados;


    public Tramite() {

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getTiempo_entrega() {
        return tiempo_entrega;
    }

    public void setTiempo_entrega(int tiempo_entrega) {
        this.tiempo_entrega = tiempo_entrega;
    }

    public int getTramites_realizados() {
        return tramites_realizados;
    }

    public void setTramites_realizados(int tramites_realizados) {
        this.tramites_realizados = tramites_realizados;
    }
}
