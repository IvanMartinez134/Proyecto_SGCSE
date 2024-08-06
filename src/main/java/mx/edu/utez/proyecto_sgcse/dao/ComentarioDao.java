package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.Comentario;
import mx.edu.utez.proyecto_sgcse.model.Documento;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ComentarioDao {

    public boolean agregarComentario(Comentario com) {

        String query = "INSERT INTO COMENTARIOS (texto, cta_id) VALUES (?,?)";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, com.getComentario());
            ps.setInt(2, com.getCta_id());


            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                fila = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al ejecutar la consulta SQL: " + e.getMessage());
        }

        return fila;
    }
}
