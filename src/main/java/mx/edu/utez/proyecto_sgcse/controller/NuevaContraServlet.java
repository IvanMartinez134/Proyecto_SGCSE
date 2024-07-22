package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.io.IOException;

@WebServlet(name = "NuevaContraServlet", value = "/nuevaContra")
public class NuevaContraServlet extends HttpServlet {
        private final UserDao userDao = new UserDao();

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String pwd = req.getParameter("contrasena");
            int id = Integer.parseInt(req.getParameter("operacion"));

            User user = new User();
            user.setPwd(pwd);
            user.setId(id);

            boolean updated = userDao.updateContra(user);

            if (updated) {
                //resp.sendRedirect("index.jsp");
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            } else {
                req.setAttribute("message", "Error al actualizar el usuario");
                req.getRequestDispatcher("error.jsp").forward(req, resp);
            }
        }

}
