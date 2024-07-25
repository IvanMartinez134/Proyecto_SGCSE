package mx.edu.utez.proyecto_sgcse.model;

import com.ctc.wstx.shaded.msv_core.datatype.xsd.datetime.IDateTimeValueType;

import java.io.Serializable;

public class Cita implements Serializable {
    private int id;
    private String fecha_hora;
    private int status;
    private int usr_id;
    private int vta_id;
    private int tdt_id;


    public Cita() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha_hora() {
        return fecha_hora;
    }

    public void setFecha_hora(String fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUsr_id() {
        return usr_id;
    }

    public void setUsr_id(int usr_id) {
        this.usr_id = usr_id;
    }

    public int getVta_id() {
        return vta_id;
    }

    public void setVta_id(int vta_id) {
        this.vta_id = vta_id;
    }

    public int getTdt_id() {
        return tdt_id;
    }

    public void setTdt_id(int tdt_id) {
        this.tdt_id = tdt_id;
    }
}


