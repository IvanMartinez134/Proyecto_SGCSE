package mx.edu.utez.proyecto_sgcse.dao;
import mx.edu.utez.proyecto_sgcse.model.Cita;
import mx.edu.utez.proyecto_sgcse.model.Documento;
import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


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



    public Documento obtenerDoc(int cta_id)  {
        String query = "SELECT * FROM documentos WHERE id = ?";
       Documento doc = null;
        try (Connection con = DatabaseConnectionManager.getConnection();
        PreparedStatement ps = con.prepareStatement(query)){
            ps.setInt(1, cta_id);

            try (ResultSet rs = ps.executeQuery( )) {
                doc = new Documento();
                doc.setId(rs.getInt("id"));
                doc.setDireccion(rs.getString("direccion"));
                doc.setCta_id(rs.getInt("cta_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doc;
    }

    public List<Documento> getAllDocumentos(int cta_id) {
        List<Documento> dco = new ArrayList<>();
        String query = "select * from documentos where cta_id = ? and direccion != 'uploads/null' ";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, cta_id);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Documento d = new Documento();
                    d.setId(rs.getInt("id"));
                    d.setDireccion(rs.getString("direccion"));
                    d.setCta_id(rs.getInt("cta_id"));


                    dco.add(d);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dco;
    }


}
