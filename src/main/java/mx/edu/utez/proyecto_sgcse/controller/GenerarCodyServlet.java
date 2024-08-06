package mx.edu.utez.proyecto_sgcse.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;
import mx.edu.utez.proyecto_sgcse.utils.GmailSender;
import mx.edu.utez.proyecto_sgcse.utils.SimpleRandomStringGenerator;


import java.io.IOException;

@WebServlet(name = "GenerarCodyServlet", value ="/generarCody")
public class GenerarCodyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("correo");
        UserDao dao = new UserDao();
        User u = dao.getOne(email);
        if (u != null) {
            SimpleRandomStringGenerator generator = new SimpleRandomStringGenerator();
            String cody = generator.generateRandomString(20);
            u.setCody(cody);
            dao.updateCody(email,u);
            try {
                new GmailSender().sendMail(email,"Recupera tu contraseña",
                        "<a href=\"http://localhost:8080/Proyecto_SGCSE_war_exploded/recuContra?cody="+cody+"&id="+ u.getId()+"\">Recuperar Contraseña</a>");



                req.getSession().setAttribute("mensaje", "Correo de recuperación enviado con éxito.");
                resp.sendRedirect("esperarCody.jsp");


            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        }else {
            req.getSession().setAttribute("mensaje", "El correo no esta registrado");
            resp.sendRedirect("index.jsp");
        }
    }

}
