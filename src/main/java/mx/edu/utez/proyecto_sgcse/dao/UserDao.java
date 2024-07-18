package mx.edu.utez.proyecto_sgcse.dao;
import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserDao {

    public User getOne(String email, String pwd) {
        User user = new User();

        String query = "SELECT * FROM usuarios WHERE email = ? AND pwd = SHA2(?, 256)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, pwd);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {// Crear el objeto User solo si se encuentra un resultado
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
                    user.setCarrera(rs.getInt("cra_id"));
                    user.setRol(rs.getInt("tdu_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public User consUser(int id) {
        User user = null;
        String query = "SELECT id, nombre, apll_1, apll_2, email, status FROM usuarios WHERE id = ?";

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


