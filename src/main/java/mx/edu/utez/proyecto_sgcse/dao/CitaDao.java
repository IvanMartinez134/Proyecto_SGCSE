package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.Cita;
import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CitaDao {
    public boolean generarCita(Cita c) {
        String query = "INSERT INTO CITAS ( fecha_y_hora, usr_id, tdt_id) VALUES ( ?, ?, ?)";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, c.getFecha_hora());
                ps.setInt(2, c.getUsr_id());
                ps.setInt(3, c.getTdt_id());


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

    public boolean asignarCita(int vta_id,int id) {
        String query = "UPDATE citas SET vta_id = ? WHERE id = ?";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, vta_id);
            ps.setInt(2, id);
            fila = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fila;
    }




    public List<Cita> getAllCitasPendientes() {
        List<Cita> citas = new ArrayList<>();
        String query = "select * from ver_citas_pendientes";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Cita c = new Cita();
                c.setId(rs.getInt("id"));
                c.setFecha(rs.getString("fecha"));
                c.setHora(rs.getString("hora"));
                c.setAlumno(rs.getString("nombre"));
                c.setTipo_doc(rs.getString("documento"));


                citas.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return citas;
    }

    public List<Cita> getAllCitasAsignadas() {
        List<Cita> citas = new ArrayList<>();
        String query = "select * from ver_citas_asignadas";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Cita c = new Cita();
                c.setId(rs.getInt("id"));
                c.setFecha(rs.getString("fecha"));
                c.setHora(rs.getString("hora"));
                c.setAlumno(rs.getString("nombre"));
                c.setTipo_doc(rs.getString("documento"));
                c.setVta_id(rs.getInt("vta_id"));
                c.setEtsado(rs.getInt("status"));


                citas.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return citas;
    }





}
