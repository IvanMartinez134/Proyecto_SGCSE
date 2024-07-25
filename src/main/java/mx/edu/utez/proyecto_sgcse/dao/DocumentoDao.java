package mx.edu.utez.proyecto_sgcse.dao;
import mx.edu.utez.proyecto_sgcse.model.Documento;
import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DocumentoDao {

    public boolean agregarDoc(Documento doc) {

        String query = "INSERT INTO DOCUMENTOS (direccion, cta_id) VALUES (?,?)";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, doc.getDireccion());
            ps.setInt(2, doc.getCta_id());


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
