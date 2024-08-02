package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.io.IOException;

@WebServlet (name = "EditarVentanillaServlet", value = "/editarVentanilla")
public class EditarVentanillaServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userDao.consVen(id);

        if (user != null) {
            req.setAttribute("user", user);
            req.getRequestDispatcher("editarVentanilla.jsp").forward(req, resp);
        } else {
            req.setAttribute("message", "Usuario no encontrado");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}
