package mx.edu.utez.proyecto_sgcse.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.proyecto_sgcse.dao.CitaDao;
import mx.edu.utez.proyecto_sgcse.dao.TramiteDao;
import mx.edu.utez.proyecto_sgcse.model.Cita;

import java.io.IOException;

@WebServlet(name = "CitaServlet", value = "/procesarCita")
public class CitaServlet extends HttpServlet {

    private CitaDao citaDao = new CitaDao();

    private TramiteDao tramiteDao = new TramiteDao();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String fechaHora = req.getParameter("fecha_hora");
            int usrId = Integer.parseInt(req.getParameter("usr_id"));
            int vtaId = Integer.parseInt(req.getParameter("vta_id"));
            int tdtId = Integer.parseInt(req.getParameter("tdt_id"));

            Cita cita = new Cita();
            cita.setFecha_hora(fechaHora);
            cita.setUsr_id(usrId);
            cita.setVta_id(vtaId);
            cita.setTdt_id(tdtId);


            boolean citaProcesada = procesarCita(cita);


            if (citaProcesada) {
                resp.sendRedirect("success.jsp");
            } else {
                resp.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al procesar la cita", e);
        }
    }


    // Aqui le cambiamos dependiendo

    private boolean procesarCita(Cita cita) {
        boolean citaGenerada = citaDao.generarCita(cita);
        if (citaGenerada) {
            boolean tramiteActualizado = tramiteDao.actTramitesRealizados(cita.getTdt_id());
            return tramiteActualizado;
        }
        return false;
    }

}
