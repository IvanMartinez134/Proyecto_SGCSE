package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
        UserDao dao = new UserDao();
        User u = dao.getOne(email, pwd);
        int rol = u.getRol();
//        System.out.println(rol);
//        System.out.println(u.getEmail());
//        System.out.println(u.getId());
//        System.out.println(u.getCarrera());

        String ruta = "index.jsp"; // Ruta por defecto

        if (u.getEmail() != null) {
            // Si el usuario existe en la base de datos
            switch (rol) {
                case 1:
                    ruta = "pageAdmin.jsp";
                    break;
                case 2:
                    ruta = "pageAdministrativo.jsp";
                    break;
                case 3:
                    ruta = "pageEst.jsp";
                    break;
                default:
                    ruta = "error.jsp"; // O a una página de error específica
                    break;
            }
        } else {
            // El usuario no existe en la base de datos
            HttpSession session = req.getSession();
            session.setAttribute("mensaje", "El usuario no existe en la base de datos");
        }

        // Redirigir al usuario a la ruta correspondiente
        resp.sendRedirect(ruta);
    }
}
