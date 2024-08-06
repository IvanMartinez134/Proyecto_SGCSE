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

        if (u == null) {
            req.setAttribute("mensaje", "El usuario no existe o la contraseña es incorrecta");
            req.getRequestDispatcher("contraMala.jsp").forward(req, resp);
        } else {

            HttpSession session = req.getSession(true);
            session.setAttribute("user", u);

            int rol = u.getRol();
            String ruta = "";
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
                    ruta = "error.jsp";
                    break;
            }
            resp.sendRedirect(ruta);
        }
    }

}


