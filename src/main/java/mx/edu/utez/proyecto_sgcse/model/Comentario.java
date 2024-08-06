package mx.edu.utez.proyecto_sgcse.model;

import java.io.Serializable;

public class Comentario implements Serializable {
    private int id;
    private String comentario;
    private int cta_id;

    public Comentario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getCta_id() {
        return cta_id;
    }

    public void setCta_id(int cta_id) {
        this.cta_id = cta_id;
    }
}
