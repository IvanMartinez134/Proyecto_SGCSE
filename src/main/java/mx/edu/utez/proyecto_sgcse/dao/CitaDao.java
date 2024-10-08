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
        String query = "CALL agendar_cita( ?, ?, ?)";
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

    public Cita getOneCita(String fecha_hora) {
        Cita c = null;
        String query = "SELECT * FROM CITAS WHERE fecha_y_hora = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, fecha_hora);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c = new Cita();
                    c.setId(rs.getInt("id"));
                    c.setFecha_hora(rs.getString("fecha_y_hora"));
                    c.setUsr_id(rs.getInt("usr_id"));
                    c.setTdt_id(rs.getInt("tdt_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

    public Cita getOneCita(int id) {
        Cita c = null;
        String query = "SELECT * FROM ver_citas WHERE usr_id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c = new Cita();
                    c.setId(rs.getInt("id"));
                    c.setFecha(rs.getString("fecha"));
                    c.setHora(rs.getString("hora"));
                    c.setVta_id(rs.getInt("vta_id"));
                    c.setTipo_doc(rs.getString("documento"));
                    c.setStatus(rs.getInt("status"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

    public Cita getCita(int id) {
        Cita c = null;
        String query = "SELECT * FROM ver_citas WHERE id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c = new Cita();
                    c.setId(rs.getInt("id"));
                    c.setFecha(rs.getString("fecha"));
                    c.setHora(rs.getString("hora"));
                    c.setVta_id(rs.getInt("vta_id"));
                    c.setTipo_doc(rs.getString("documento"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

    public boolean asignarCita(int vta_id,int id) {
        String query = "UPDATE CITAS SET vta_id = ? WHERE id = ?";
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

    public boolean updateCitaStatus(Cita c) {
        String query = "UPDATE CITAS SET status = ? WHERE id = ?";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, c.getStatus());
            ps.setInt(2,c.getId());
            fila = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fila;
    }


    public List<Cita> getAllCitas(String fecha) {
        List<Cita> citas = new ArrayList<>();
        String query = "select * from ver_citas where fecha = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, fecha);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cita c = new Cita();
                    c.setFecha(rs.getString("fecha"));
                    c.setHora(rs.getString("hora"));

                    citas.add(c);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return citas;
    }



    public List<Cita> getAllCitasPendientes() {
        List<Cita> citas = new ArrayList<>();
        String query = "select * from ver_citas where vta_id is null";

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
        String query = "select * from ver_citas where vta_id is not null";

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


    public List<Cita> getAllCitasPendientesVen(int vta_id) {
        List<Cita> citas = new ArrayList<>();
        String query = "select * from ver_citas where vta_id = ? and status in (1,2)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, vta_id);

            try (ResultSet rs = ps.executeQuery()) {
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
            }

        } catch (SQLException e) {
                e.printStackTrace();
        }

        return citas;
    }


    public List<Cita> getAllCitasPendientesEst(int id) {
        List<Cita> citas = new ArrayList<>();
        String query = "select * from ver_citas where usr_id = ? and status in (3,0)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
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
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return citas;
    }

    public List<Cita> getAllCitasVen(int vta_id) {
        List<Cita> citas = new ArrayList<>();
        String query = "select * from ver_citas where vta_id = ? and status in (3,0)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, vta_id);

            try (ResultSet rs = ps.executeQuery()) {
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
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return citas;
    }

    public boolean cancelarCita(int id) {
        String query = "UPDATE CITAS set fecha_y_hora = null,usr_id = null,tdt_id = null,vta_id = null, status = 7 WHERE id = ?";
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

    public boolean eliminarCita(int id) {
        String query = "delete from CITAS where id = ?";
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
