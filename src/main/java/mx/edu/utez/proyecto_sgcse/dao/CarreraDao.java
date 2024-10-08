package mx.edu.utez.proyecto_sgcse.dao;

import com.mysql.cj.jdbc.DatabaseMetaData;
import mx.edu.utez.proyecto_sgcse.model.Carrera;
import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarreraDao {

    public List<Carrera> getAllCarreras(String division) {
        List<Carrera> carreras = new ArrayList<>();
        String query = "SELECT id, nombre FROM CARRERAS where division = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)){
            ps.setString(1, division);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Carrera c = new Carrera();
                    c.setId(rs.getInt("id"));
                    c.setNombre(rs.getString("nombre"));

                    carreras.add(c);


                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carreras;
    }


    public List<Carrera> obtenerCarrerasPorDivision(String division) {
        List<Carrera> carreras = new ArrayList<>();
        String query = "SELECT id, nombre FROM CARRERAS WHERE division = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, division);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Carrera carrera = new Carrera();
                    carrera.setId(rs.getInt("id"));
                    carrera.setNombre(rs.getString("nombre"));

                    carreras.add(carrera);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carreras;
    }
}
