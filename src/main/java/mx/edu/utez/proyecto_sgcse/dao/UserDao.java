package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {


    public User getOne(String email, String pwd) {
        User user = new User();
        String query = "SELECT * FROM usuarios WHERE email = ? AND pwd = SHA2(?, 256)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, pwd);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
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
        User u = null;
        String query = "SELECT id, nombre, apll_1, apll_2, email, num_cuatri, grupo FROM usuarios WHERE id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new User();
                    u.setId(rs.getInt("id"));
                    u.setNombre(rs.getString("nombre"));
                    u.setApll_1(rs.getString("apll_1"));
                    u.setApll_2(rs.getString("apll_2"));
                    u.setEmail(rs.getString("email"));
                    u.setCuatri(rs.getInt("num_cuatri"));
                    u.setGrupo(rs.getString("grupo"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }


    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT id, nombre, apll_1, apll_2, email, status FROM usuarios";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setNombre(rs.getString("nombre"));
                user.setApll_1(rs.getString("apll_1"));
                user.setApll_2(rs.getString("apll_2"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getInt("status"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }


    public boolean agregarUser(User u) {
        String query = "INSERT INTO usuarios (nombre, apll_1, apll_2, email, pwd, matri) VALUES (?, ?, ?, ?, SHA2(?, 256), ?)";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApll_1());
            ps.setString(3, u.getApll_2());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getPwd());
            ps.setString(6, u.getMatri());

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


    public boolean updateUser(User u) {
        String query = "UPDATE usuarios SET nombre = ?, apll_1 = ?, apll_2 = ?, email = ?, num_cuatri = ?, grupo = ? WHERE id = ?";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApll_1());
            ps.setString(3, u.getApll_2());
            ps.setString(4, u.getEmail());
            ps.setInt(5,u.getCuatri());
            ps.setString(6, u.getGrupo());
            ps.setInt(7,u.getId());
            fila = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fila;
    }


    public boolean deleteUser(String email) {
        String query = "UPDATE usuarios SET status = False WHERE email = ?";
        boolean rowDeleted = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }



}
