package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;
import mx.edu.utez.proyecto_sgcse.model.Cita;

import java.io.IOException;

@WebServlet(name = "CancelarCitaServlet", value = "/cancelarCita")
public class CancelarCitaServlet extends HttpServlet {
    private CitaDao citaDao = new CitaDao();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("cta_id"));
        Cita c = citaDao.getCita(id);

        if (c != null) {
            boolean deleted = citaDao.cancelarCita(id);
                if(deleted){
                    resp.sendRedirect("consultarCitas.jsp");
                } else {
                    req.setAttribute("message", "Error al eliminar la cita");
                    req.getRequestDispatcher("error.jsp").forward(req, resp);
                }
        } else {
            req.setAttribute("message", "La cita no existe");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }


    }


}
