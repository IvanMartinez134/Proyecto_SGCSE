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


    public Map<String, Integer> obtenerEstTramites() {
        Map<String, Integer> resultados = new HashMap<>();
        String query = "SELECT tipo.decripcion AS tipo_de_tramite, COUNT(*) AS cantidad FROM CITAS c JOIN TIPOS_DE_TRAMITES tipo ON c.tdt_id = tipo.id WHERE c.status == 0 GROUP BY tipo.decripcion ORDER BY tipo.decripcion";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String tipoDeTramite = rs.getString("tipo_de_tramite");
                int cantidad = rs.getInt("cantidad");
                resultados.put(tipoDeTramite, cantidad);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultados;
    }




}