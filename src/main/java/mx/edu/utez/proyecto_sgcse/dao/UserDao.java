package mx.edu.utez.proyecto_sgcse.dao;

import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    //Para la lectura de una entidad en una base de datos
    public User getOne(String email,String pwd) {
        User u = new User();
        //Los simbolos ? son para evitar la inyección de codigo SQL
        String query = "select * from users where email = ? and pwd = sha2(?,256)";

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
                u.setEmail(rs.getString("email"));
                u.setPwd(rs.getString("pwd"));
                u.setStatus(rs.getBoolean("usr_status"));
                u.setRol(rs.getString("rol"));
                u.setRec_code(rs.getString("rec_code"));
                u.setName(rs.getString("name_s"));
                u.setSurname_P(rs.getString("surname_p"));
                u.setSurname_M(rs.getString("surname_m"));


            }
        }catch (SQLException e) {
            e.printStackTrace();

        }

        return u;
    }
/*
    public boolean insert(User user) {
        boolean flag = false;
        String query = "insert into users (user_name,pass,email) values(?,sha2(?,256),?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getUser_name());
            ps.setString(2, user.getPass());
            ps.setString(3, user.getEmail());
            if(ps.executeUpdate() == 1) {
                flag = true;// si se inserto el dato
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        return flag;
    }
*/
}
