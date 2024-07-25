package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.io.IOException;

@WebServlet(name = "ActualizarVentanillaServlet", value = "/actVentanillas")
public class ActualizarVentanillaServlet extends HttpServlet {

    private final UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String apll1 = req.getParameter("apll_1");
        String apll2 = req.getParameter("apll_2");
        String email = req.getParameter("email");
        String tel = req.getParameter("tel");
        int id = Integer.parseInt(req.getParameter("id"));

        User user = new User();
        user.setNombre(nombre);
        user.setApll_1(apll1);
        user.setApll_2(apll2);
        user.setEmail(email);
        user.setTel(tel);
        user.setId(id);

        boolean updated = userDao.updateVen(user);

        if (updated) {
            resp.sendRedirect("consVentanilla.jsp");
        } else {
            req.setAttribute("message", "Error al actualizar el usuario");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}
