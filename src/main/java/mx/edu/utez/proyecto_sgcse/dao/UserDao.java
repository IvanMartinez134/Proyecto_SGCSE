package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao implements Validar {

    @Override
    public int validar(User user) {
        int r = 0;
        String query = "select * from usuarios where email = ? and pwd = sha2(?, 256)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPwd());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    r = 1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return r;
    }


    @Override
    public int validar(String email, String pwd) {
        int r = 0;
        String query = "select * from usuarios where email = ? and pwd = sha2(?, 256)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, pwd);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    r = 1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return r;
    }

    public User getOne(String email, String pwd) {
        User user = null;
        String query = "select u.id, u.nombre, u.apll_1, u.apll_2, u.email, u.pwd, u.tel, u.cody, u.num_cuatri, u.grupo, c.nombre as carrera, c.division, tu.rol from usuarios u " +
                "inner join carreras c on u.cra_id = c.id " +
                "inner join tipos_de_usuarios tu on u.tdu_id = tu.id " +
                "where u.email = ? and u.pwd = sha2(?, 256)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, pwd);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setNombre(rs.getString("nombre"));
                    user.setApll_1(rs.getString("apll_1"));
                    user.setApll_2(rs.getString("apll_2"));
                    user.setEmail(rs.getString("email"));
                    user.setPwd(rs.getString("pwd"));
                    user.setTel(rs.getInt("tel"));
                    user.setCody(rs.getString("cody"));
                    user.setCuatri(rs.getInt("num_cuatri"));
                    user.setGrupo(rs.getString("grupo"));
                    user.setStatus(rs.getInt("status"));
                    user.setCarrera(rs.getString("carrera"));
                    user.setDivision(rs.getString("division"));
                    user.setRol(rs.getString("rol"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public User consUser(int id) {
        User user = null;
        String query = "select id, nombre, apll_1, apll_2, email, status from usuarios where id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setNombre(rs.getString("nombre"));
                    user.setApll_1(rs.getString("apll_1"));
                    user.setApll_2(rs.getString("apll_2"));
                    user.setEmail(rs.getString("email"));
                    user.setStatus(rs.getInt("status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}

