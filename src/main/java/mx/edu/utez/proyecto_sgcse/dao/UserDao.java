package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;
import org.jfree.util.PublicCloneable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {


    public User getOne(String email, String pwd) {
        User user = null;
        String query = "SELECT * FROM usuarios WHERE email = ? AND pwd = SHA2(?, 256)";

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
                    user.setTel(rs.getString("tel"));
                    user.setCody(rs.getString("cody"));
                    user.setCuatri(rs.getInt("num_cuatri"));
                    user.setGrupo(rs.getString("grupo"));
                    user.setStatus(rs.getInt("status"));
                    user.setCarrera(rs.getInt("cra_id"));
                    user.setRol(rs.getInt("tdu_id"));
                    user.setMatri(rs.getString("matri"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public User getOne(String email) {
        User user = new User();
        String query = "SELECT * FROM usuarios WHERE email = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user.setId(rs.getInt("id"));
                    user.setNombre(rs.getString("nombre"));
                    user.setApll_1(rs.getString("apll_1"));
                    user.setApll_2(rs.getString("apll_2"));
                    user.setEmail(rs.getString("email"));
                    user.setPwd(rs.getString("pwd"));
                    user.setTel(rs.getString("tel"));
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

    public User getOne(int id) {
        User user = new User();
        String query = "SELECT * FROM usuarios WHERE id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user.setId(rs.getInt("id"));
                    user.setNombre(rs.getString("nombre"));
                    user.setApll_1(rs.getString("apll_1"));
                    user.setApll_2(rs.getString("apll_2"));
                    user.setEmail(rs.getString("email"));
                    user.setPwd(rs.getString("pwd"));
                    user.setTel(rs.getString("tel"));
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



    public User consVen(int id) {
        User u = null;
        String query = "select u.id, u.nombre, u.apll_1, u.apll_2, u.email, u.tel, t.tipo from ventanillas v inner join usuarios u on u.id = v.usr_id inner join turnos t on t.id = v.tro_id WHERE u.id = ?";

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
                    u.setTurno(rs.getString("tipo"));
                    u.setTel(rs.getString("tel"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }

    public User getOneVen(int vta_id) {
        User u = null;
        String query = "select u.id, u.nombre, u.apll_1, u.apll_2, u.email, u.tel, t.tipo from ventanillas v inner join usuarios u on u.id = v.usr_id inner join turnos t on t.id = v.tro_id WHERE v.id = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, vta_id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new User();
                    u.setId(rs.getInt("id"));
                    u.setNombre(rs.getString("nombre"));
                    u.setApll_1(rs.getString("apll_1"));
                    u.setApll_2(rs.getString("apll_2"));
                    u.setEmail(rs.getString("email"));
                    u.setTurno(rs.getString("tipo"));
                    u.setTel(rs.getString("tel"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }




    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT id, nombre, apll_1, apll_2, email, status FROM usuarios where tdu_id = 3";

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


    public List<User> getAllVen() {
        List<User> vents = new ArrayList<>();
        String query = "select v.id, u.nombre, u.apll_1, u.apll_2, u.email, u.tel, t.tipo from ventanillas v\n" +
                "inner join usuarios u\n" +
                "on u.id = v.usr_id\n" +
                "inner join turnos t\n" +
                "on t.id = v.tro_id where u.tdu_id = 2";

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
                user.setTurno(rs.getString("tipo"));
                user.setTel(rs.getString("tel"));
                vents.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vents;
    }


    public boolean agregarUser(User u) {
        String query = "INSERT INTO usuarios (nombre, apll_1, apll_2, email, cra_id, pwd, matri,num_cuatri,grupo,tdu_id) VALUES (?, ?, ?, ?, ?, SHA2(?, 256), ?, ?, ?, 3)";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApll_1());
            ps.setString(3, u.getApll_2());
            ps.setString(4, u.getEmail());
            ps.setInt(5, u.getCarrera());
            ps.setString(6, u.getPwd());
            ps.setString(7, u.getMatri());
            ps.setInt(8,u.getCuatri());
            ps.setString(9,u.getGrupo());

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


    public boolean agregarVen(User u) {
        String query = "INSERT INTO usuarios (nombre, apll_1, apll_2, email, tel, pwd,tdu_id) VALUES (?, ?, ?, ?,?, SHA2(?, 256), 2)";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApll_1());
            ps.setString(3, u.getApll_2());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getTel());
            ps.setString(6, u.getPwd());


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

    public boolean updateVen(User u) {
        String query = "UPDATE usuarios SET nombre = ?, apll_1 = ?, apll_2 = ?, email = ?, tel = ? WHERE id = ?";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApll_1());
            ps.setString(3, u.getApll_2());
            ps.setString(4, u.getEmail());
            ps.setString(5,u.getTel());
            ps.setInt(6,u.getId());
            fila = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fila;
    }



    public boolean updateContra(User u) {
        String query = "UPDATE usuarios SET pwd = sha2(?,256) WHERE id = ?";
        boolean fila = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, u.getPwd());
            ps.setInt(2,u.getId());
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


    public boolean updateCody(String email,User u) {
        boolean flag = false;
        String query = "update usuarios set cody = ? where email = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getCody());
            ps.setString(2, email);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }



    public List<User> BuscarVen(String texto) {
        List<User> lista = new ArrayList<>();
        String query = "select u.id, u.nombre, u.apll_1, u.apll_2, u.email, u.tel, t.tipo from ventanillas v\n" +
                "inner join usuarios u\n" +
                "on u.id = v.usr_id\n" +
                "inner join turnos t\n" +
                "on t.id = v.tro_id where u.id like '%"+texto+"%' or u.nombre like '%"+texto+"%' or u.email like '%"+texto+"%' or u.tel like '%"+texto+"%'" ;

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
                user.setTurno(rs.getString("tipo"));
                user.setTel(rs.getString("tel"));
                lista.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }



}
