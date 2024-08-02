package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.UserDao;
import mx.edu.utez.proyecto_sgcse.model.User;

import java.io.IOException;

@WebServlet(name = "RecuContraServlet", value ="/recuContra")
public class RecuContraServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String cody = req.getParameter("cody");
        UserDao dao = new UserDao();
        User u = dao.getOne(id);
        if (u.getCody().equals(cody)) {
            resp.sendRedirect("http://localhost:8080/pruebaGit_war_exploded/actualizarContra?id="+id);

        }else {
            req.getSession().setAttribute("mensaje", "El correo no esta registrado");
            resp.sendRedirect("index.jsp");
        }
    }

}
