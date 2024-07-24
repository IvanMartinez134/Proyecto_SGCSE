package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;

import java.io.IOException;

@WebServlet (name = "EliminarVentanillaServlet ", value = "/eliminarVen")
public class EliminarVentanillaServlet extends HttpServlet {

    private UserDao userDao = new UserDao();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        if (email != null) {
            boolean deleted = userDao.deleteUser(email);
            if (deleted) {
                resp.sendRedirect("consVentanilla.jsp");
            } else {
                req.setAttribute("message", "Error al eliminar el usuario");
                req.getRequestDispatcher("error.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("message", "Email del usuario no proporcionado");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}
