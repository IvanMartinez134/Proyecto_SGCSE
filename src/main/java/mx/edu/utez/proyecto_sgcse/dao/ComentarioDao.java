package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.Cita;
import mx.edu.utez.proyecto_sgcse.model.Comentario;
import mx.edu.utez.proyecto_sgcse.model.Documento;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public Comentario getOneComentario(int id) {
        Comentario c = null;
        String query = "SELECT * FROM COMENTARIOS WHERE cta_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c = new Comentario();
                    c.setId(rs.getInt("id"));
                    c.setComentario(rs.getString("texto"));
                    c.setCta_id(rs.getInt("cta_id"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

    public boolean eliminarComent(int id) {
        String query = "delete from COMENTARIOS where cta_id = ?";
        boolean rowDeleted = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }

}
