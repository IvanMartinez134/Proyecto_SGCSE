package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;
import mx.edu.utez.proyecto_sgcse.model.Cita;

import java.io.IOException;

@WebServlet (name= "TerminarCitaServlet", value = "/terminarCita")
public class TerminarCitaServlet extends HttpServlet {
    CitaDao citaDao = new CitaDao();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int vta_id = Integer.parseInt(req.getParameter("vta_id"));
        Cita c = new Cita();
        c.setId(id);
        c.setEtsado(0);
        boolean updated = citaDao.updateCitaStatus(c);
        if (updated) {
            resp.sendRedirect("consultarCitasVen.jsp?vta_id="+vta_id);
        }
    }
}
