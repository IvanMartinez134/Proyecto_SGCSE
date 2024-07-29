package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

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

    public List<Map<String, Object>> obtenerEstTramites() {
        List<Map<String, Object>> estadisticas = new ArrayList<>();
        String query = "SELECT DATE(c.fecha_y_hora) AS fecha, t.descripcion AS tipo_de_tramite, COUNT(c.id) AS cantidad FROM CITAS c JOIN TIPOS_DE_TRAMITES t ON c.tdt_id = t.id GROUP BY DATE(c.fecha_y_hora), t.descripcion";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> estadistica = new HashMap<>();
                estadistica.put("fecha", rs.getString("fecha"));
                estadistica.put("tipo_de_tramite", rs.getString("tipo_de_tramite"));
                estadistica.put("cantidad", rs.getInt("cantidad"));
                estadisticas.add(estadistica);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return estadisticas;
    }
}