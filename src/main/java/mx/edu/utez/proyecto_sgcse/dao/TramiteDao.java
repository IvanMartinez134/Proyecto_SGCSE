package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TramiteDao {

    public boolean actTramitesRealizados(int id) {

        String query = "UPDATE TIPOS_DE_TRAMITES SET tramites_realizados = tramites_realizados + 1 WHERE id = ?";
        boolean actualizado = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);

            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                actualizado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al ejecutar la consulta SQL: " + e.getMessage());
        }

        return actualizado;
    }


        // El map es algo chsitoso jajaja
        public List<Map<String, Object>> obtenerEstTramites() {
            List<Map<String, Object>> result = new ArrayList<>();
            String query = "SELECT DATE(c.fecha_y_hora) AS fecha, t.descripcion AS tipo_de_tramite, COUNT(c.id) AS cantidad FROM CITAS c JOIN TIPOS_DE_TRAMITES t ON c.tdt_id = t.id GROUP BY DATE(c.fecha_y_hora), t.descripcion";

            try (Connection con = DatabaseConnectionManager.getConnection();
                 PreparedStatement ps = con.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("tipo_de_tramite", rs.getString("tipo_de_tramite"));
                    row.put("cantidad", rs.getInt("cantidad"));

                    // Convertir la fecha a timestamp Unix (segundos desde el 1 de enero de 1970)
                    java.sql.Date sqlDate = rs.getDate("fecha");
                    long timestamp = sqlDate.toLocalDate().atStartOfDay(ZoneId.systemDefault()).toEpochSecond();

                    row.put("fecha", timestamp); // Usar timestamp Unix en lugar de la fecha en formato cadena
                    result.add(row);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return result;
        }

}