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
import java.time.format.DateTimeFormatter;

@WebServlet(name = "CitaServlet", value = "/procesarCita")
public class CitaServlet extends HttpServlet {

    private CitaDao citaDao = new CitaDao();

    private TramiteDao tramiteDao = new TramiteDao();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int tdtId = Integer.parseInt(req.getParameter("tramite"));
            String fecha_hora = req.getParameter("fecha_hora");
            int usrId = Integer.parseInt(req.getParameter("usr_id"));



            System.out.println(usrId);
            System.out.println(fecha_hora);


            Cita cita = new Cita();
            cita.setFecha_hora(fecha_hora);
            cita.setTdt_id(tdtId);
            cita.setUsr_id(usrId);



            boolean citaProcesada = citaDao.generarCita(cita);


                if (citaProcesada) {
                    Cita c = citaDao.getOneCita(fecha_hora);
                    resp.sendRedirect("subirDoc.jsp?cta_id=" + c.getId());
                } else {
                    resp.sendRedirect("error.jsp");
                }
        } catch (Exception e) {
            e.printStackTrace();

            req.getSession().setAttribute("mensaje", "Error al procesar la cita. Por favor, intenta de nuevo.");
            resp.sendRedirect("error500.jsp");
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
