package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        List<Map<String, Object>> estadisticas = new ArrayList<>();
        String query = "SELECT MONTH(c.fecha_y_hora) AS mes, COUNT(c.id) AS cantidad FROM CITAS c GROUP BY MONTH(c.fecha_y_hora)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> estadistica = new HashMap<>();
                estadistica.put("mes", rs.getInt("mes"));
                estadistica.put("cantidad", rs.getInt("cantidad"));
                estadisticas.add(estadistica);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return estadisticas;
    }

}