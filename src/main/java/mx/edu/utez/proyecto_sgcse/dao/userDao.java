package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.user;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userDao {

    public user getOne(String email, String pwd) {
        user u = new user();
        //Los simbolos ? son para evitar la inyección de codigo SQL
        String query = "select u.id, u.nombre, u.apll_1, u.apll_2, u.email, u.pwd, u.tel, u.cody, u.num_cuatri, u.grupo, c.nombre, c.division, tu.rol from usuarios u" +
                "inner join carreras c" +
                "on u.cra_id = c.id" +
                "inner join tipos_de_usuarios tu" +
                "on u.tdu_id = tu.id  " +
                "where email = ? and pwd = sha2(?,256)";

        try {
            //Conectarme a la base de datos
            Connection con = DatabaseConnectionManager.getConnection();
            //Me prepara la consulta para ser ejecutada
            PreparedStatement ps = con.prepareStatement(query);
            //Voy a definir los parametros del query (los "?")
            ps.setString(1, email);
            ps.setString(2, pwd);
            //Ejecutar la consulta
            ResultSet rs = ps.executeQuery();
            //Obtener la informacion del result set
            if(rs.next()) {
                //que el usuario si existe en la base de datos
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setApll_1(rs.getString("apll_1"));
                u.setApll_2(rs.getString("apll_2"));
                u.setEmail(rs.getString("email"));
                u.setPwd(rs.getString("pwd"));
                u.setTel(rs.getInt("tel"));
                u.setCody(rs.getString("cody"));
                u.setCuatri(rs.getInt("num_cuatri"));
                u.setGrupo(rs.getString("grupo"));
                u.setStatus(rs.getInt("status"));
                u.setCarrera(rs.getString("carrera"));
                u.setDivision(rs.getString("division"));
                u.setRol(rs.getString("rol"));



            }
        }catch (SQLException e) {
            e.printStackTrace();

        }

        return u;
    }



    // Para la consulta de usarios

    public user consUser(int id) {
        user u = new user();
        //Los simbolos ? son para evitar la inyección de codigo SQL

        String query = "select id, nombre, apll_1, apll_2, email, status  from usuarios where id = ?";

        try {
            //Conectarme a la base de datos
            Connection con = DatabaseConnectionManager.getConnection();
            //Me prepara la consulta para ser ejecutada
            PreparedStatement ps = con.prepareStatement(query);
            //Voy a definir los parametros del query (los "?")

            ps.setString(1, String.valueOf(id));

            //Ejecutar la consulta
            ResultSet rs = ps.executeQuery();

            //Obtener la informacion del result set
            if(rs.next()) {
                //que el usuario si existe en la base de datos
                u.setId(rs.getInt("id"));
                u.setNombre(rs.getString("nombre"));
                u.setApll_1(rs.getString("apll_1"));
                u.setApll_2(rs.getString("apll_2"));
                u.setEmail(rs.getString("email"));
                u.setStatus(rs.getInt("status"));
            }
        }catch (SQLException e) {
            e.printStackTrace();

        }

        return u;

        // Para poder ver la consulta
    }




}
