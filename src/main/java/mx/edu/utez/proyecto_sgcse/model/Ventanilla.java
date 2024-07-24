package mx.edu.utez.proyecto_sgcse.model;

import java.io.Serializable;

public class Ventanilla implements Serializable {
    private int id;
    private int user_id;
    private int turno_id;

    public Ventanilla() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTurno_id() {
        return turno_id;
    }

    public void setTurno_id(int turno_id) {
        this.turno_id = turno_id;
    }
}
