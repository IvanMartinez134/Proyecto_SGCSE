package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.Cita;
import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class CitaDao {
    public boolean generarCita(Cita c) {
        String query = "INSERT INTO CITAS ( fecha_y_hora, usr_id, vta_id, tdt_id) VALUES ( ?, ?, ?, ?)";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, c.getFecha_hora());
                ps.setInt(2, c.getVta_id());
                ps.setInt(3, c.getVta_id());
                ps.setInt(4, c.getTdt_id());


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
