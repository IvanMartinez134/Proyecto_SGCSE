package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;
import mx.edu.utez.proyecto_sgcse.model.Cita;

import java.io.IOException;

@WebServlet(name = "DocIncorrectaServlet ", value = "/docIncorrecta")
public class DocIncorrecta extends HttpServlet {

    private CitaDao citaDao = new CitaDao();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int status = 4;

        Cita c = new Cita();
        c.setId(id);
        c.setStatus(status);

        boolean updated = citaDao.updateCitaStatus(c);

        if (updated) {
            resp.sendRedirect("pageAdministrativo.jsp");
        }

    }

}
